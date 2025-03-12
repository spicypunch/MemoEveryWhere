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
import '../../features/settings/presentation/settings_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final authState = ref.watch(authProvider);

    return GoRouter(
      initialLocation: '/',
      redirect: (BuildContext context, GoRouterState state) {
        if (state.uri.path == '/next') {
          return authState.when(
            data: (data) {
              if (data.isSignedIn) {
                return '/home';
              } else {
                return '/signin';
              }
            },
            loading: () => null,
            error: (_, __) => '/signin',
          );
        }
      },
      routes: [
        GoRoute(
          path: '/',
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
            ]),
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
            GoRoute(
              path: '/settings',
              name: 'setting',
              builder: (context, state) => SettingsScreen(),
            )
          ],
        ),
      ],
    );
  },
);
