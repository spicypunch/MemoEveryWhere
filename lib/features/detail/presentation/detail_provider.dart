import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/detail/domain/repository/detail_repository.dart';
import 'package:memo_everywhere/features/detail/domain/state/detail_state.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> onOpen(LinkableElement link) async {
    final Uri? uri = Uri.tryParse(link.url);
    if (uri != null) {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print('Could not launch $uri');
      }
    } else {
      print('Invalid URL: ${link.url}');
    }
  }

// Future<void> getUpdatedItem(String memoId) async {
//   state = const AsyncValue.loading();
//   state = await AsyncValue.guard(() async {
//     final result = await _updateRepository.getUpdatedItem(memoId);
//   });
// }
}
