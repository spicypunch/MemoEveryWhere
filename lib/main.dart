import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/go_router.dart';
import 'package:memo_everywhere/provider_observer.dart';

void main() {
  runApp(
      ProviderScope(observers: [Logger()], child: _App())
  );
}

class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(routerProvider),
    );
  }
}
