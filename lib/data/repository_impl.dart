import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_everywhere/domain/repository.dart';

class RepositoryImpl implements Repository {
  final FirebaseAuth firebaseAuth;

  RepositoryImpl({required this.firebaseAuth});

  @override
  Future<void> signIn(String email, String passWord) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: passWord,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      throw _handleAuthException(e);
    }
  }

  @override
  Future<void> signup(String email, String passWord) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      throw _handleAuthException(e);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
      throw _handleAuthException(e);
    }
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return '비밀번호가 너무 약합니다.';
      case 'email-already-in-use':
        return '이미 사용 중인 이메일입니다.';
      case 'user-not-found':
        return '존재하지 않는 계정입니다.';
      case 'wrong-password':
        return '잘못된 비밀번호입니다.';
      default:
        return '인증 오류가 발생했습니다.';
    }
  }
}
