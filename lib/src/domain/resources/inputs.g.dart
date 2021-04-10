// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedResponsePayload _$_$_FeedResponsePayloadFromJson(
    Map<String, dynamic> json) {
  return _$_FeedResponsePayload(
    data: GetFeedData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_FeedResponsePayloadToJson(
        _$_FeedResponsePayload instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

_$_GetFeedData _$_$_GetFeedDataFromJson(Map<String, dynamic> json) {
  return _$_GetFeedData(
    getFeed: Feed.fromJson(json['getFeed'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_GetFeedDataToJson(_$_GetFeedData instance) =>
    <String, dynamic>{
      'getFeed': instance.getFeed.toJson(),
    };
