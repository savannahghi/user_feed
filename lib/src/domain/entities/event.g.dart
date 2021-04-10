// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    id: json['id'] as String?,
    name: json['name'] as String?,
    context: json['context'] == null
        ? null
        : Context.fromJson(json['context'] as Map<String, dynamic>),
    payload: json['payload'] == null
        ? null
        : Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'context': instance.context?.toJson(),
      'payload': instance.payload?.toJson(),
    };
