import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';
part 'detail_state.g.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState({
    bool? updateSuccess,
    bool? deleteSuccess,
    String? error,
  }) = _DetailState;

  factory DetailState.fromJson(Map<String, dynamic> json) =>
      _$DetailStateFromJson(json);
}