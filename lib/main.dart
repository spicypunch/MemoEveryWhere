import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/core/config/firebase_config.dart';

import 'core/go_router/go_router.dart';
import 'core/log/provider_observer.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseConfig.webOptions,
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(ProviderScope(observers: [Logger()], child: _App()));
}

class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(routerProvider),
      debugShowCheckedModeBanner: false,
    );
  }
}
