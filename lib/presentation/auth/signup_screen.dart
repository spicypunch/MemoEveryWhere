import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/presentation/auth/auth_provider.dart';

import '../../shared/components/default_button.dart';
import '../../shared/components/default_layout.dart';
import '../../shared/components/default_text_field.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(authProvider);

    final emailController = useTextEditingController();
    final pwController = useTextEditingController();
    final pwConfirmController = useTextEditingController();

    final (isEmailValid, isPwMatched) = useSignUpValidation(
      emailController: emailController,
      pwController: pwController,
      pwConfirmController: pwConfirmController,
    );

    final isFormValid = isEmailValid && isPwMatched;

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
                    Text(
                      'PassWord',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      Navigator.pop(context);
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

(bool, bool) useSignUpValidation({
  required TextEditingController emailController,
  required TextEditingController pwController,
  required TextEditingController pwConfirmController,
}) {
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
          pwConfirmController.text.isNotEmpty;
    }

    pwController.addListener(validatePw);
    pwConfirmController.addListener(validatePw);

    return () {
      pwController.removeListener(validatePw);
      pwConfirmController.removeListener(validatePw);
    };
  }, [pwController, pwConfirmController]);

  return (isEmailValid.value, isPwMatched.value);
}
