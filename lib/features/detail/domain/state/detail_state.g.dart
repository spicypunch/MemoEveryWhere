// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailStateImpl _$$DetailStateImplFromJson(Map<String, dynamic> json) =>
    _$DetailStateImpl(
      updateSuccess: json['updateSuccess'] as bool?,
      deleteSuccess: json['deleteSuccess'] as bool?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$DetailStateImplToJson(_$DetailStateImpl instance) =>
    <String, dynamic>{
      'updateSuccess': instance.updateSuccess,
      'deleteSuccess': instance.deleteSuccess,
      'error': instance.error,
    };
