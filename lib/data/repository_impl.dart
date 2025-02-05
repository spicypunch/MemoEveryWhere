import 'package:memo_everywhere/domain/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepositoryImpl implements Repository {
  final SupabaseClient _client;

  RepositoryImpl(this._client);

  @override
  Future<bool> signIn(String email, String passWord) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: passWord,
      );

      if (response.user == null) {
        throw Exception('로그인 실패');
      }
      return response.user != null;
    } catch (e) {
      throw Exception('로그인 실패: ${e.toString()}');
    }
  }

  @override
  Future<bool> signup(String email, String passWord) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: passWord,
        emailRedirectTo: null,
      );
      return response.user != null;
    } catch (e) {
      throw Exception('회원가입 실패: ${e.toString()}');
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      final response = await _client.auth.signOut();
      return true;
    } catch (e) {
      throw Exception('로그아웃 실패: ${e.toString()}');
      return false;
    }
  }
}
