import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/provider/firebase_provider.dart';
import '../../data/repository/update_repositoryimpl.dart';

final updateRepositoryProvider = Provider<UpdateRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseFireStore = ref.watch(firestoreProvider);
  return UpdateRepositoryImpl(auth: firebaseAuth, firestore: firebaseFireStore);
});

abstract class UpdateRepository {
  Future<bool> updateItem(String memoId, String newTitle, String newContent);
}