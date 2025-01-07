import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'main_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/main',
    routes: [
      GoRoute(path: '/main',builder: (context, state) => MainScreen())
    ]
  );
});
