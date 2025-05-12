// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailState _$DetailStateFromJson(Map<String, dynamic> json) {
  return _DetailState.fromJson(json);
}

/// @nodoc
mixin _$DetailState {
  bool? get updateSuccess => throw _privateConstructorUsedError;
  bool? get deleteSuccess => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Serializes this DetailState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailStateCopyWith<DetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStateCopyWith<$Res> {
  factory $DetailStateCopyWith(
          DetailState value, $Res Function(DetailState) then) =
      _$DetailStateCopyWithImpl<$Res, DetailState>;
  @useResult
  $Res call({bool? updateSuccess, bool? deleteSuccess, String? error});
}

/// @nodoc
class _$DetailStateCopyWithImpl<$Res, $Val extends DetailState>
    implements $DetailStateCopyWith<$Res> {
  _$DetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateSuccess = freezed,
    Object? deleteSuccess = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      updateSuccess: freezed == updateSuccess
          ? _value.updateSuccess
          : updateSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      deleteSuccess: freezed == deleteSuccess
          ? _value.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailStateImplCopyWith<$Res>
    implements $DetailStateCopyWith<$Res> {
  factory _$$DetailStateImplCopyWith(
          _$DetailStateImpl value, $Res Function(_$DetailStateImpl) then) =
      __$$DetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? updateSuccess, bool? deleteSuccess, String? error});
}

/// @nodoc
class __$$DetailStateImplCopyWithImpl<$Res>
    extends _$DetailStateCopyWithImpl<$Res, _$DetailStateImpl>
    implements _$$DetailStateImplCopyWith<$Res> {
  __$$DetailStateImplCopyWithImpl(
      _$DetailStateImpl _value, $Res Function(_$DetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateSuccess = freezed,
    Object? deleteSuccess = freezed,
    Object? error = freezed,
  }) {
    return _then(_$DetailStateImpl(
      updateSuccess: freezed == updateSuccess
          ? _value.updateSuccess
          : updateSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      deleteSuccess: freezed == deleteSuccess
          ? _value.deleteSuccess
          : deleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailStateImpl implements _DetailState {
  const _$DetailStateImpl({this.updateSuccess, this.deleteSuccess, this.error});

  factory _$DetailStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailStateImplFromJson(json);

  @override
  final bool? updateSuccess;
  @override
  final bool? deleteSuccess;
  @override
  final String? error;

  @override
  String toString() {
    return 'DetailState(updateSuccess: $updateSuccess, deleteSuccess: $deleteSuccess, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStateImpl &&
            (identical(other.updateSuccess, updateSuccess) ||
                other.updateSuccess == updateSuccess) &&
            (identical(other.deleteSuccess, deleteSuccess) ||
                other.deleteSuccess == deleteSuccess) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, updateSuccess, deleteSuccess, error);

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      __$$DetailStateImplCopyWithImpl<_$DetailStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailStateImplToJson(
      this,
    );
  }
}

abstract class _DetailState implements DetailState {
  const factory _DetailState(
      {final bool? updateSuccess,
      final bool? deleteSuccess,
      final String? error}) = _$DetailStateImpl;

  factory _DetailState.fromJson(Map<String, dynamic> json) =
      _$DetailStateImpl.fromJson;

  @override
  bool? get updateSuccess;
  @override
  bool? get deleteSuccess;
  @override
  String? get error;

  /// Create a copy of DetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailStateImplCopyWith<_$DetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
