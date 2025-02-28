import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_everywhere/features/home/domain/entity/memo.dart';
import 'package:memo_everywhere/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  HomeRepositoryImpl({required this.auth, required this.firestore});

  @override
  Future<List<Memo>> getMemos() async {
    try {
      final user = auth.currentUser;
      if (user == null) return Future.value([]);

      final snapshot = await firestore
      .collection('memos')
      .where('userId', isEqualTo: user.uid)
      .orderBy('createdAt', descending: true)
      .get();
      return snapshot.docs.map((doc) => Memo.fromFirestore(doc)).toList();
    } catch (e) {
      print("Firestore Error: $e");
      return Future.value([]);
    }
  }
}
