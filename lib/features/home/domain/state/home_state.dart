import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/memo.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Memo> memos,
    bool? signOutSuccess,
    String? error,
}) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}