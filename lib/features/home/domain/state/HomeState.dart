import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Memo> memos,
    String? error,
}) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}