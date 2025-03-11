import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/detail/domain/repository/detail_repository.dart';
import 'package:memo_everywhere/features/detail/domain/state/detail_state.dart';

final detailProvider =
    AsyncNotifierProvider<DetailProvider, DetailState>(() => DetailProvider());

class DetailProvider extends AsyncNotifier<DetailState> {
  late final DetailRepository _updateRepository;

  @override
  Future<DetailState> build() async {
    _updateRepository = ref.watch(detailRepositoryProvider);
    return const DetailState();
  }

  void resetState() {
    state = const AsyncValue.data(DetailState());
  }

  Future<void> updateItem(
    String memoId,
    String newTitle,
    String newContent,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result =
          await _updateRepository.updateItem(memoId, newTitle, newContent);
      return DetailState(updateSuccess: result);
    });
  }

  Future<void> deleteItem(String memoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = await _updateRepository.deleteItem(memoId);
      return DetailState(deleteSuccess: result);
    });
  }

  // Future<void> getUpdatedItem(String memoId) async {
  //   state = const AsyncValue.loading();
  //   state = await AsyncValue.guard(() async {
  //     final result = await _updateRepository.getUpdatedItem(memoId);
  //   });
  // }
}