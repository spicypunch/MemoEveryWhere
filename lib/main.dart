import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/shared/provider_observer.dart';
import 'package:memo_everywhere/shared/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future<void> main() async {
    await Supabase.initialize(
      url: 'https://swwywvcpsvrmpggtecen.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN3d3l3dmNwc3ZybXBnZ3RlY2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY5OTUwODgsImV4cCI6MjA1MjU3MTA4OH0.1z5eMq4pkBibYLw31pE8-ebv6f3nwxArZmMXWU2Hvbc',
    );
    runApp(
        ProviderScope(observers: [Logger()], child: _App())
    );
  }
}

class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(routerProvider),
    );
  }
}
