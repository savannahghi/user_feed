// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Context _$_$_ContextFromJson(Map<String, dynamic> json) {
  return _$_Context(
    userID: json['userID'] as String?,
    flavour: _$enumDecodeNullable(_$FlavourEnumMap, json['flavour'],
        unknownValue: Flavour.UNKNOWN),
    organizationID: json['organizationID'] as String?,
    locationID: json['locationID'] as String?,
    timestamp: json['timestamp'] as String?,
  );
}

Map<String, dynamic> _$_$_ContextToJson(_$_Context instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'flavour': _$FlavourEnumMap[instance.flavour],
      'organizationID': instance.organizationID,
      'locationID': instance.locationID,
      'timestamp': instance.timestamp,
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
