import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../presentation/auth/login_screen.dart';
import '../presentation/auth/register_screen.dart';
import '../presentation/detail/detail_screen.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/settings/settings_screen.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/auth',
      redirect: (BuildContext context, GoRouterState state) {
        return null;
      },
      routes: [
        GoRoute(
          path: '/auth',
          name: 'auth',
          builder: (context, state) => LoginScreen(),
          routes: [
            GoRoute(
              path: 'signup',
              name: 'signup',
              builder: (context, state) => RegisterScreen(),
            )
          ],
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
