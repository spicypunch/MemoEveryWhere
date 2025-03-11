import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/memo.dart';
import '../../../../core/provider/firebase_provider.dart';
import '../../data/repository/detail_repositoryimpl.dart';

final detailRepositoryProvider = Provider<DetailRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseFireStore = ref.watch(firestoreProvider);
  return DetailRepositoryImpl(auth: firebaseAuth, firestore: firebaseFireStore);
});

abstract class DetailRepository {
  Future<bool> updateItem(String memoId, String newTitle, String newContent);
  Future<bool> deleteItem(String memoId);
  // Future<Memo?> getUpdatedItem(String memoId);
}