import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/home/domain/repository/home_repository.dart';
import 'package:memo_everywhere/features/home/domain/state/home_state.dart';
import 'package:memo_everywhere/core/models/memo.dart';

import '../../auth/presentation/auth_provider.dart';

final homeProvider =
AsyncNotifierProvider<HomeProvider, HomeState>(() => HomeProvider());

class HomeProvider extends AsyncNotifier<HomeState> {
  late final HomeRepository _homeRepository;
  StreamSubscription<List<Memo>>? _subscription;
  bool _initialized = false;

  @override
  Future<HomeState> build() async {
    if (!_initialized) {
      _homeRepository = ref.watch(homeRepositoryProvider);
      _initialized = true;
    }

    final authState = ref.watch(authProvider);

    authState.whenData((state) {
      if (state.isSignedIn) {
        refreshSubscription();
      }
    });

    ref.onDispose(() {
      _subscription?.cancel();
    });

    return const HomeState();
  }

  void refreshSubscription() {
    _subscription?.cancel();

    _subscription = _homeRepository.getMemos().listen(
          (memos) {
        state = AsyncValue.data(HomeState(memos: memos));
      },
      onError: (error, stackTrace) {
        state = AsyncValue.error(error, stackTrace);
      },
    );
  }

  void cleanUp() {
    _subscription?.cancel();
    _subscription = null;
    state = const AsyncValue.data(HomeState());
  }
}