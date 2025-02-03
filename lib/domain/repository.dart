abstract class Repository {
  Future<void> signIn(String email, String passWord);
  Future<void> signup(String email, String passWord);
  Future<void> signOut();
}