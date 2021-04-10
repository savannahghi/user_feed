// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    id: json['id'] as String?,
    sequenceNumber: json['sequenceNumber'] as int?,
    replyTo: json['replyTo'] as String?,
    postedByUID: json['postedByUID'] as String?,
    postedByName: json['postedByName'] as String?,
    text: json['text'] as String?,
    timestamp: json['timestamp'] as String?,
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sequenceNumber': instance.sequenceNumber,
      'replyTo': instance.replyTo,
      'postedByUID': instance.postedByUID,
      'postedByName': instance.postedByName,
      'text': instance.text,
      'timestamp': instance.timestamp,
    };
