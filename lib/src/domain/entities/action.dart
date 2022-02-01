// Package imports:
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';

part 'action.freezed.dart';
part 'action.g.dart';

@freezed
class Action with _$Action {
  factory Action({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
    @JsonKey(name: 'actionType', unknownEnumValue: ActionType.UNKNOWN)
        ActionType? actionType,
    @JsonKey(name: 'handling', unknownEnumValue: Handling.UNKNOWN)
        Handling? handling,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'icon') Link? icon,
    @JsonKey(name: 'allowAnonymous') bool? allowAnonymous,
  }) = _Action;

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}
