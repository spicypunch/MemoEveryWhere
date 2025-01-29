import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memo_everywhere/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repository_impl.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final repositoryProvier = Provider<Repository>((ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  return RepositoryImpl(supabaseClient);
});