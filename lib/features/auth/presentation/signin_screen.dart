import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/core/utils/contextExtensions.dart';
import 'package:memo_everywhere/features/auth/presentation/auth_provider.dart';

import '../../../core/components/default_button.dart';
import '../../../core/components/default_layout.dart';
import '../../../core/components/default_text_form_field.dart';
import '../domain/state/auth_state.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<AuthState>>(
      authProvider,
      (previous, next) {
        next.whenOrNull(
          data: (state) {
            if (state.isSignedIn) {
              context.goNamed("home");
            }
            if (state.error != null) {
              context.showSnackBar(state.error!);
            }
          },
          error: (error, _) => context.showSnackBar(error.toString())
        );
      },
    );

    final emailController = useTextEditingController();
    final pwController = useTextEditingController();

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
                    SizedBox(height: 80),
                    DefaultButton(
                        title: 'Login',
                        onTap: () {
                          ref.read(authProvider.notifier).signIn(
                                emailController.text,
                                pwController.text,
                              );
                        }),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      context.pushNamed("signup");
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
