// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feed _$_$_FeedFromJson(Map<String, dynamic> json) {
  return _$_Feed(
    id: json['id'] as String?,
    sequenceNumber: json['sequenceNumber'] as int?,
    uid: json['uid'] as String?,
    isAnonymous: json['isAnonymous'] as bool?,
    flavour: _$enumDecodeNullable(_$FlavourEnumMap, json['flavour'],
        unknownValue: Flavour.UNKNOWN),
    actions: (json['actions'] as List<dynamic>?)
        ?.map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    nudges: (json['nudges'] as List<dynamic>?)
        ?.map((e) => Nudge.fromJson(e as Map<String, dynamic>))
        .toList(),
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_FeedToJson(_$_Feed instance) => <String, dynamic>{
      'id': instance.id,
      'sequenceNumber': instance.sequenceNumber,
      'uid': instance.uid,
      'isAnonymous': instance.isAnonymous,
      'flavour': _$FlavourEnumMap[instance.flavour],
      'actions': instance.actions?.map((e) => e.toJson()).toList(),
      'nudges': instance.nudges?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
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

const _$FlavourEnumMap = {
  Flavour.CONSUMER: 'CONSUMER',
  Flavour.PRO: 'PRO',
  Flavour.UNKNOWN: 'UNKNOWN',
};
