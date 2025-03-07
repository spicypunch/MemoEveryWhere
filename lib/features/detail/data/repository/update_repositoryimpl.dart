import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_everywhere/core/models/memo.dart';
import 'package:memo_everywhere/features/detail/domain/repository/update_repository.dart';

class UpdateRepositoryImpl implements UpdateRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  UpdateRepositoryImpl({required this.auth, required this.firestore});

  @override
  Future<bool> updateItem(String memoId, String newTitle, String newContent) async {
    try {
      if (auth.currentUser == null) return false;
      final Map<String, dynamic> updateData = {};
      updateData['title'] = newTitle;
      updateData['content'] = newContent;
      updateData['createdAt'] = FieldValue.serverTimestamp();
      await firestore.collection('memos').doc(memoId).update(updateData);
      return true;
    } catch (e) {
      print("Firestore Error: $e");
      return false;
    }
  }

  // @override
  // Future<Memo?> getUpdatedItem(String memoId) async {
  //   try {
  //     if (auth.currentUser == null) return null;
  //
  //     final memoRef = await firestore.collection('memos').doc(memoId).get();
  //
  //     if (memoRef.exists) {
  //       return Memo.fromFirestore(memoRef);
  //     } else {
  //       print("Document with ID $memoId does not exist");
  //       return null;
  //     }
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }
}
