import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/core/provider/firebase_provider.dart';
import 'package:memo_everywhere/features/add/data/repository/add_repository_impl.dart';

final addRepositoryProvider = Provider<AddRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseFireStore = ref.watch(firestoreProvider);
  return AddRepositoryImpl(auth: firebaseAuth, firestore: firebaseFireStore);
});

abstract class AddRepository {
  Future<bool> addItem(String title, String content);
}