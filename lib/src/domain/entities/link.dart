import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';

part 'link.freezed.dart';
part 'link.g.dart';

@freezed
class Link with _$Link {
  factory Link({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'linkType', unknownEnumValue: LinkType.UNKNOWN)
        LinkType? linkType,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'thumbnail') String? thumbnail,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
