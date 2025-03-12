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

  // String _handleAuthException(FirebaseAuthException e) {
  //   switch (e.code) {
  //     case 'weak-password':
  //       return '비밀번호가 너무 약합니다.';
  //     case 'email-already-in-use':
  //       return '이미 사용 중인 이메일입니다.';
  //     case 'user-not-found':
  //       return '존재하지 않는 계정입니다.';
  //     case 'wrong-password':
  //       return '잘못된 비밀번호입니다.';
  //     default:
  //       return '인증 오류가 발생했습니다.';
  //   }
  // }
}
