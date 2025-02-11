import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/provider/firebase_provider.dart';
import '../../data/repository/auth_repository_impl.dart';

final repositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepositoryImpl(firebaseAuth: firebaseAuth);
});

abstract class AuthRepository {
  Future<UserCredential> signIn(String email, String passWord);
  Future<UserCredential> signup(String email, String passWord);
  Future<bool> signOut();
}