// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Link _$_$_LinkFromJson(Map<String, dynamic> json) {
  return _$_Link(
    id: json['id'] as String?,
    url: json['url'] as String?,
    linkType: _$enumDecodeNullable(_$LinkTypeEnumMap, json['linkType'],
        unknownValue: LinkType.UNKNOWN),
    title: json['title'] as String?,
    description: json['description'] as String?,
    thumbnail: json['thumbnail'] as String?,
  );
}

Map<String, dynamic> _$_$_LinkToJson(_$_Link instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'linkType': _$LinkTypeEnumMap[instance.linkType],
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
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

const _$LinkTypeEnumMap = {
  LinkType.YOUTUBE_VIDEO: 'YOUTUBE_VIDEO',
  LinkType.PNG_IMAGE: 'PNG_IMAGE',
  LinkType.PDF_DOCUMENT: 'PDF_DOCUMENT',
  LinkType.SVG_IMAGE: 'SVG_IMAGE',
  LinkType.UNKNOWN: 'UNKNOWN',
};
