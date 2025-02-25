import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/memo.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Memo> memos,
    String? error,
}) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}