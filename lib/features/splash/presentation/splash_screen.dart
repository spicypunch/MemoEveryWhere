import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/auth/presentation/auth_provider.dart';

import '../../../core/colors/default_colors.dart';
import '../../../core/components/default_layout.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // authProvider의 상태를 비동기적으로 확인
    ref.read(authProvider.future).then((authState) {
      if (authState.isSignedIn) {
        context.goNamed("home");
      } else {
        context.goNamed("signin");
      }
    });

    return DefaultLayout(
      child: Center(
        child: Text(
          'Memo EveryWhere',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: DefaultColors.modernBlue,
          ),
        ),
      ),
    );
  }
}