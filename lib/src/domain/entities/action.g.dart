// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Action _$_$_ActionFromJson(Map<String, dynamic> json) {
  return _$_Action(
    id: json['id'] as String?,
    sequenceNumber: json['sequenceNumber'] as int?,
    actionType: _$enumDecodeNullable(_$ActionTypeEnumMap, json['actionType'],
        unknownValue: ActionType.UNKNOWN),
    handling: _$enumDecodeNullable(_$HandlingEnumMap, json['handling'],
        unknownValue: Handling.UNKNOWN),
    name: json['name'] as String?,
    icon: json['icon'] == null
        ? null
        : Link.fromJson(json['icon'] as Map<String, dynamic>),
    allowAnonymous: json['allowAnonymous'] as bool?,
  );
}

Map<String, dynamic> _$_$_ActionToJson(_$_Action instance) => <String, dynamic>{
      'id': instance.id,
      'sequenceNumber': instance.sequenceNumber,
      'actionType': _$ActionTypeEnumMap[instance.actionType],
      'handling': _$HandlingEnumMap[instance.handling],
      'name': instance.name,
      'icon': instance.icon?.toJson(),
      'allowAnonymous': instance.allowAnonymous,
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

const _$ActionTypeEnumMap = {
  ActionType.PRIMARY: 'PRIMARY',
  ActionType.SECONDARY: 'SECONDARY',
  ActionType.OVERFLOW: 'OVERFLOW',
  ActionType.FLOATING: 'FLOATING',
  ActionType.TERTIARY: 'TERTIARY',
  ActionType.GLOBAL: 'GLOBAL',
  ActionType.UNKNOWN: 'UNKNOWN',
};

const _$HandlingEnumMap = {
  Handling.INLINE: 'INLINE',
  Handling.FULL_PAGE: 'FULL_PAGE',
  Handling.UNKNOWN: 'UNKNOWN',
};
