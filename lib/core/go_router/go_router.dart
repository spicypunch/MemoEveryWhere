import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth/signin_screen.dart';
import '../../features/auth/presentation/auth/signup_screen.dart';
import '../../features/detail/detail_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/settings/settings_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/signin',
      redirect: (BuildContext context, GoRouterState state) {
        return null;
      },
      routes: [
        GoRoute(
          path: '/signin',
          name: 'signin',
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          path: '/signup',
          name: 'signup',
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => HomeScreen(),
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
