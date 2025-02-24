import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/home/domain/repository/home_repository.dart';
import 'package:memo_everywhere/features/home/domain/state/HomeState.dart';

final homeProvider =
    AsyncNotifierProvider<HomeProvider, HomeState>(() => HomeProvider());

class HomeProvider extends AsyncNotifier<HomeState> {
    late final HomeRepository _homeRepository;

    @override
    FutureOr<HomeState> build() {
        _homeRepository = ref.watch(homeRepositoryProvider);
        throw HomeState();
    }

    Future<void> getMemos() async {
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() async {
            try {
                final result = await _homeRepository.getMemos();
                return HomeState(memos: result);
            } catch (e) {
                return HomeState(error: e.toString());
            }
        });
    }
}