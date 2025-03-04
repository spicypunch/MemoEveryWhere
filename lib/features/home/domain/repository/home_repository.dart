import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/home/domain/entity/memo.dart';

import '../../../../core/provider/firebase_provider.dart';
import '../../data/repository/home_repository_impl.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firebaseFireStore = ref.watch(firestoreProvider);
  return HomeRepositoryImpl(auth: firebaseAuth, firestore: firebaseFireStore);
});

abstract class HomeRepository {
  Stream<List<Memo>> getMemos();
}
