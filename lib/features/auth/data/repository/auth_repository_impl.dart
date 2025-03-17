import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_everywhere/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth auth;

  AuthRepositoryImpl({required this.auth});

  @override
  Future<UserCredential> signIn(String email, String passWord) async {
    try {
      return await auth.signInWithEmailAndPassword(
        email: email,
        password: passWord,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<UserCredential> signup(String email, String passWord) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await auth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      print(e);
      return false;
    }
  }

  @override
  User? getCurrentUser() {
    return auth.currentUser;
  }
}
