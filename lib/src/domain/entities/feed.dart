import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_feed/src/domain/entities/action.dart';
import 'package:user_feed/src/domain/entities/item.dart';
import 'package:user_feed/src/domain/entities/nudge.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  factory Feed({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
    @JsonKey(name: 'uid') String? uid,

    /// Note : [isAnonymous] is not removed here since the backend will always return it
    @JsonKey(name: 'isAnonymous') bool? isAnonymous,
    @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
        Flavour? flavour,
    @JsonKey(name: 'actions') List<Action>? actions,
    @JsonKey(name: 'nudges') List<Nudge>? nudges,
    @JsonKey(name: 'items') List<Item>? items,
  }) = _Feed;

  /// [initial] returns initial invalid feed. The caller, usually in the app,
  ///  should check the validity of the feed.
  factory Feed.initial() => Feed();

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
