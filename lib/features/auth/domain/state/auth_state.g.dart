// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      isSignedUp: json['isSignedUp'] as bool? ?? false,
      isSignedIn: json['isSignedIn'] as bool? ?? false,
      isSignedOut: json['isSignedOut'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'isSignedUp': instance.isSignedUp,
      'isSignedIn': instance.isSignedIn,
      'isSignedOut': instance.isSignedOut,
      'error': instance.error,
    };
