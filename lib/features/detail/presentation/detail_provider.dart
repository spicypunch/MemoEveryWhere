import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/detail/domain/repository/update_repository.dart';
import 'package:memo_everywhere/features/detail/domain/state/detail_state.dart';

final detailProvider =
    AsyncNotifierProvider<DetailProvider, DetailState>(() => DetailProvider());

class DetailProvider extends AsyncNotifier<DetailState> {
  late final UpdateRepository _updateRepository;

  @override
  Future<DetailState> build() async {
    _updateRepository = ref.watch(updateRepositoryProvider);
    return const DetailState();
  }

  Future<void> updateItem(
      String memoId, String newTitle, String newContent) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        final result =
            await _updateRepository.updateItem(memoId, newTitle, newContent);
        return DetailState(updateSuccess: result);
      } catch (e) {
        return DetailState(error: e.toString());
      }
    });
  }
}
