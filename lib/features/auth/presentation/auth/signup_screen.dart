import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/auth/domain/state/auth_state.dart';

import '../../../../core/components/default_button.dart';
import '../../../../core/components/default_layout.dart';
import '../../../../core/components/default_text_field.dart';
import 'auth_provider.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final pwController = useTextEditingController();
    final pwConfirmController = useTextEditingController();

    final isEmailValid = useState(false);
    final isPwMatched = useState(false);

    useEffect(() {
      void validateEmail() {
        final email = emailController.text;
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
        );
        isEmailValid.value = emailRegex.hasMatch(email);
      }

      emailController.addListener(validateEmail);
      return () => emailController.removeListener(validateEmail);
    }, [emailController]);

    useEffect(() {
      void validatePw() {
        isPwMatched.value = pwController.text == pwConfirmController.text &&
            pwController.text.isNotEmpty &&
            pwConfirmController.text.isNotEmpty &&
            pwController.text.length >= 6 &&
            pwConfirmController.text.length >= 6;
      }

      pwController.addListener(validatePw);
      pwConfirmController.addListener(validatePw);

      return () {
        pwController.removeListener(validatePw);
        pwConfirmController.removeListener(validatePw);
      };
    }, [pwController, pwConfirmController]);

    ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
      next.whenOrNull(
        data: (state) {
          if (state.isSignedUp) {
            context.pop();
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        error: (error, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        ),
      );
    });

    final isFormValid = isEmailValid.value && isPwMatched.value;

    return DefaultLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Email',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    DefaultTextFormField(
                      label: 'email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          'PassWord',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),  // 텍스트 사이 간격
                        Text(
                          'at least 6 digits',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    DefaultTextFormField(
                      label: 'password',
                      controller: pwController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Confirm PassWord',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    DefaultTextFormField(
                      label: 'confirm password',
                      controller: pwConfirmController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 80),
                    DefaultButton(
                      title: 'Sign Up',
                      isEnabled: isFormValid,
                      onTap: isFormValid
                          ? () {
                              ref.read(authProvider.notifier).signUp(
                                    emailController.text,
                                    pwController.text,
                                  );
                            }
                          : null,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      'Back to Login',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
