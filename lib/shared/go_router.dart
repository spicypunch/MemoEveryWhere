import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memo_everywhere/features/detail/detail_screen.dart';
import 'package:memo_everywhere/features/login/login_screen.dart';
import 'package:memo_everywhere/features/settings/settings_screen.dart';
import 'package:memo_everywhere/features/signup/signup_screen.dart';

import '../features/main/main_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/login',
      redirect: (BuildContext context, GoRouterState state) {
        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'signup',
              name: 'signup',
              builder: (context, state) => SignupScreen(),
            )
          ],
        ),
        GoRoute(
          path: '/main',
          name: 'main',
          builder: (context, state) => MainScreen(),
          routes: [
            GoRoute(
              path: 'detail/:id',
              name: 'detail',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return DetailScreen();
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
