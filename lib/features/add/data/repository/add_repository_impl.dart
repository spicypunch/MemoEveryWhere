import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_everywhere/features/add/domain/repository/add_repository.dart';

class AddRepositoryImpl implements AddRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AddRepositoryImpl({required this.auth, required this.firestore});

  @override
  Future<bool> addItem(String title, String content) async {
    try {
      final user = auth.currentUser;
      if (user == null) return false;

      await firestore.collection('memos').add({
        'userId': user.uid,
        'title': title,
        'content': content,
        'createdAt': FieldValue.serverTimestamp(),
      });
      return true;
    } catch (e) {
      print("Firestore Error: $e");
      return false;
    }
  }
}
