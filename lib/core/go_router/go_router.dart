import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memo_everywhere/core/models/memo.dart';
import 'package:memo_everywhere/features/add/presentation/add_screen.dart';
import 'package:memo_everywhere/features/splash/presentation/splash_screen.dart';

import '../../features/auth/presentation/auth_provider.dart';
import '../../features/auth/presentation/signin_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/detail/presentation/detail_screen.dart';
import '../../features/home/presentaion/home_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authProvider);

    return GoRouter(
      initialLocation: '/splash',
      redirect: (BuildContext context, GoRouterState state) {
        return null;
      },
      routes: [
        GoRoute(
          path: '/splash',
          name: 'splash',
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: '/signin',
          name: 'signin',
          builder: (context, state) => SignInScreen(),
          routes: [
            GoRoute(
              path: '/signup',
              name: 'signup',
              builder: (context, state) => SignUpScreen(),
            ),
          ],
        ),
        GoRoute(
          path: '/add',
          name: 'add',
          builder: (context, state) => AddScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              name: 'detail',
              builder: (context, state) {
                final memo = state.extra as Memo;
                return DetailScreen(
                  memo: memo,
                );
              },
            ),
          ],
        ),
      ],
    );
  },
);
