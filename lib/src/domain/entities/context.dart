import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';

part 'context.freezed.dart';
part 'context.g.dart';

@freezed
class Context with _$Context {
  factory Context({
    @JsonKey(name: 'userID') String? userID,
    @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
        Flavour? flavour,
    @JsonKey(name: 'organizationID') String? organizationID,
    @JsonKey(name: 'locationID') String? locationID,
    @JsonKey(name: 'timestamp') String? timestamp,
  }) = _Context;

  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);
}
