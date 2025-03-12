import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:memo_everywhere/core/models/memo.dart';
import 'package:memo_everywhere/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  HomeRepositoryImpl({required this.auth, required this.firestore});

  @override
  Stream<List<Memo>> getMemos() {
    final user = auth.currentUser;
    if (user == null) return Stream.value([]);

    return firestore
        .collection('memos')
        .where('userId', isEqualTo: user.uid)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Memo.fromFirestore(doc)).toList());
  }
}
