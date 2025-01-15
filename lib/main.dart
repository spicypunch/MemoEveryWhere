import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/shared/provider_observer.dart';
import 'package:memo_everywhere/shared/go_router.dart';

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
