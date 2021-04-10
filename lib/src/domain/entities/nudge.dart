import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sil_feed/src/domain/entities/action.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';

part 'nudge.freezed.dart';
part 'nudge.g.dart';

@freezed
class Nudge with _$Nudge {
  factory Nudge({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'actions') List<Action>? actions,
    @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
        Visibility? visibility,
    @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN) Status? status,
    @JsonKey(name: 'expiry') String? expiry,
    @JsonKey(name: 'links') List<Link>? links,
    @JsonKey(name: 'groups') List<String>? groups,
    @JsonKey(name: 'users') List<String>? users,
    @JsonKey(name: 'notificationChannels') Channel? notificationChannels,
  }) = _Nudge;

  factory Nudge.fromJson(Map<String, dynamic> json) => _$NudgeFromJson(json);
}
