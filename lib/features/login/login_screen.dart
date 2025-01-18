import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/shared/components/default_button.dart';
import 'package:memo_everywhere/shared/components/default_layout.dart';
import 'package:memo_everywhere/shared/components/default_text_field.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '로그인',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              DefaultTextFormField(label: 'email'),
              Text(
                '비밀번호',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              DefaultTextFormField(label: 'password'),
              DefaultButton(title: '로그인', onTap: () {}),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
