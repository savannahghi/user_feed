import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sil_feed/src/domain/entities/context.dart';
import 'package:sil_feed/src/domain/entities/payload.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  factory Event({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'context') Context? context,
    @JsonKey(name: 'payload') Payload? payload,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
