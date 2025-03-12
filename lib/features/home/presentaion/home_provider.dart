import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/home/domain/repository/home_repository.dart';
import 'package:memo_everywhere/features/home/domain/state/home_state.dart';
import 'package:memo_everywhere/core/models/memo.dart';

final homeProvider =
AsyncNotifierProvider<HomeProvider, HomeState>(() => HomeProvider());

class HomeProvider extends AsyncNotifier<HomeState> {
  late final HomeRepository _homeRepository;
  StreamSubscription<List<Memo>>? _subscription;

  @override
  Future<HomeState> build() async {
    _homeRepository = ref.watch(homeRepositoryProvider);

    ref.onDispose(() {
      _subscription?.cancel();
    });

    _subscription = _homeRepository.getMemos().listen(
          (memos) {
        state = AsyncValue.data(HomeState(memos: memos));
      },
      onError: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      },
    );

    return const HomeState();
  }
}
