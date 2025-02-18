import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:memo_everywhere/features/add/domain/repository/add_repository.dart';

class AddRepositoryImpl implements AddRepository {
  final FirebaseDatabase firebaseDatabase;

  AddRepositoryImpl({required this.firebaseDatabase});

  @override
  Future<bool> addItem(String title, String content) async {
    try {
      final newMemoRef = firebaseDatabase.ref().child('memos').push();
      print("URL: ${firebaseDatabase.ref()}");
      print("메모 참조 확인${newMemoRef.key}");
      await newMemoRef.set({
        'title': title,
        'content': content,
      });
      return true;
    } on FirebaseException catch (e) {
      print("Firebase Error: ${e.toString()}");
      return false;
    } catch (e) {
      print("Other Error: ${e.toString()}");
      return false;
    }
  }
}
