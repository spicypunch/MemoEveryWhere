import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/default_button.dart';
import '../../../../core/components/default_layout.dart';
import '../../../../core/components/default_text_field.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    DefaultTextFormField(label: 'email'),
                    SizedBox(height: 20),
                    Text(
                      'PassWord',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    DefaultTextFormField(label: 'password'),
                    SizedBox(height: 80),
                    DefaultButton(title: 'Login', onTap: () {}),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      context.goNamed("signup");
                    },
                    child: Text(
                      'SignUp',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
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