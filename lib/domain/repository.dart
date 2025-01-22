import 'package:memo_everywhere/domain/entity/auth_user.dart';

abstract class Repository {
  Future<AuthUser> signIn(String email, String passWord);
}