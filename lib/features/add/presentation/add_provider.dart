import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../domain/repository/add_repository.dart';
import '../domain/state/add_state.dart';

final addProvider =
AsyncNotifierProvider<AddProvider, AddState>(() => AddProvider());

class AddProvider extends AsyncNotifier<AddState> {
  late final AddRepository _addRepository;

  @override
  Future<AddState> build() async {
    _addRepository = ref.watch(addRepositoryProvider);
    return AddState();
  }

  Future<void> addItem(String title, String content) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      try {
        await _addRepository.addItem(title, content);
        return AddState(isAdded: true);
      } catch (e) {
        return AddState(error: e.toString());
      }
    });
  }
}
