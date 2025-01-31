import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/components/default_button.dart';
import '../../shared/components/default_layout.dart';
import '../../shared/components/default_text_field.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

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
                    SizedBox(height: 20),
                    Text(
                      'Confirm PassWord',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    DefaultTextFormField(label: 'confirm password'),
                    SizedBox(height: 80),
                    DefaultButton(title: 'Sign Up', onTap: () {}),
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