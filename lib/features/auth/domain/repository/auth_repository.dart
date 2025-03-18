import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/provider/firebase_provider.dart';
import '../../data/repository/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepositoryImpl(auth: firebaseAuth);
});

abstract class AuthRepository {
  Future<UserCredential> signIn(String email, String passWord);
  Future<UserCredential> signup(String email, String passWord);
  Future<bool> signOut();
  Stream<User?> authStateChange();
  User? getCurrentUser();
}