import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_state.freezed.dart';
part 'add_state.g.dart';

@freezed
class AddState with _$AddState {
  const factory AddState({
    bool? isAdded,
    String? error,
  }) = _AddState;

  factory AddState.fromJson(Map<String, dynamic> json) =>
      _$AddStateFromJson(json);

}