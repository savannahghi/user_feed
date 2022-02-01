// Package imports:
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  factory Message({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
    @JsonKey(name: 'replyTo') String? replyTo,
    @JsonKey(name: 'postedByUID') String? postedByUID,
    @JsonKey(name: 'postedByName') String? postedByName,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'timestamp') String? timestamp,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
