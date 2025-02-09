import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/provider/firebase_provider.dart';
import '../data/repository_impl.dart';

final repositoryProvider = Provider<Repository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return RepositoryImpl(firebaseAuth: firebaseAuth);
});

abstract class Repository {
  Future<void> signIn(String email, String passWord);
  Future<void> signup(String email, String passWord);
  Future<void> signOut();
}