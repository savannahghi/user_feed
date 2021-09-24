// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Item _$_$_ItemFromJson(Map<String, dynamic> json) {
  return _$_Item(
    featureImage: json['featureImage'] as String?,
    id: json['id'] as String?,
    sequenceNumber: json['sequenceNumber'] as int?,
    persistent: json['persistent'] as bool?,
    icon: json['icon'] == null
        ? null
        : Link.fromJson(json['icon'] as Map<String, dynamic>),
    author: json['author'] as String?,
    tagline: json['tagline'] as String?,
    timestamp: json['timestamp'] as String?,
    expiry: json['expiry'] as String?,
    label: json['label'] as String?,
    summary: json['summary'] as String?,
    visibility: _$enumDecodeNullable(_$VisibilityEnumMap, json['visibility']),
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
    actions: (json['actions'] as List<dynamic>?)
        ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    text: json['text'] as String?,
    textType: _$enumDecodeNullable(_$TextTypeEnumMap, json['textType']),
    links: (json['links'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        .toList(),
    conversations: (json['conversations'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        .toList(),
    groups:
        (json['groups'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    users: (json['users'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    notificationChannels: (json['notificationChannels'] as List<dynamic>?)
        ?.map((e) => _$enumDecodeNullable(_$ChannelEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ItemToJson(_$_Item instance) => <String, dynamic>{
      'featureImage': instance.featureImage,
      'id': instance.id,
      'sequenceNumber': instance.sequenceNumber,
      'persistent': instance.persistent,
      'icon': instance.icon?.toJson(),
      'author': instance.author,
      'tagline': instance.tagline,
      'timestamp': instance.timestamp,
      'expiry': instance.expiry,
      'label': instance.label,
      'summary': instance.summary,
      'visibility': _$VisibilityEnumMap[instance.visibility],
      'status': _$StatusEnumMap[instance.status],
      'actions': instance.actions?.map((e) => e.toJson()).toList(),
      'text': instance.text,
      'textType': _$TextTypeEnumMap[instance.textType],
      'links': instance.links?.map((e) => e?.toJson()).toList(),
      'conversations': instance.conversations?.map((e) => e?.toJson()).toList(),
      'groups': instance.groups,
      'users': instance.users,
      'notificationChannels': instance.notificationChannels
          ?.map((e) => _$ChannelEnumMap[e])
          .toList(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$VisibilityEnumMap = {
  Visibility.SHOW: 'SHOW',
  Visibility.HIDE: 'HIDE',
  Visibility.UNKNOWN: 'UNKNOWN',
};

const _$StatusEnumMap = {
  Status.PENDING: 'PENDING',
  Status.IN_PROGRESS: 'IN_PROGRESS',
  Status.DONE: 'DONE',
  Status.UNKNOWN: 'UNKNOWN',
};

const _$TextTypeEnumMap = {
  TextType.HTML: 'HTML',
  TextType.MARKDOWN: 'MARKDOWN',
  TextType.PLAIN: 'PLAIN',
  TextType.UNKNOWN: 'UNKNOWN',
};

const _$ChannelEnumMap = {
  Channel.FCM: 'FCM',
  Channel.EMAIL: 'EMAIL',
  Channel.SMS: 'SMS',
  Channel.WHATSAPP: 'WHATSAPP',
  Channel.UNKNOWN: 'UNKNOWN',
};
