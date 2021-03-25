import 'package:flutter/material.dart';
import 'package:sil_feed/src/shared/type_defs/feed_type_defs.dart';
import 'package:sil_feed/src/shared/widgets/feed_item_component.dart';

/// holds all the feed components together
///
/// - takes in a list of feed items and renders the ui based on that list
class FeedItemsWrapper extends StatelessWidget {
  const FeedItemsWrapper({
    Key? key,
    required this.feedItems,
    required this.flavour,
    required this.isAnonymousFunc,
    required this.resolveFunction,
    required this.pinFunction,
    required this.hideFunction,
    required this.tetherThread,
    required this.postedByUID,
    required this.isAnonymous,
    required this.postedByName,
  }) : super(key: key);

  final List<dynamic> feedItems;
  final String flavour;
  final String postedByUID;
  final bool tetherThread;
  final String postedByName;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  // a callback to resolve an item
  final feedItemActionTypeDef resolveFunction;

  // a callback to pin an item
  final feedItemActionTypeDef pinFunction;

  // a callback to hide an item
  final feedItemActionTypeDef hideFunction;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          ...feedItems.map(
            (dynamic feedItem) => FeedItemComponent(
              postedByName: postedByName,
              postedByUID: postedByUID,
              feedItem: feedItem as Map<String, dynamic>,
              flavour: flavour,
              resolveFunction: resolveFunction,
              pinFunction: pinFunction,
              hideFunction: hideFunction,
              tetherThread: tetherThread,
              isAnonymous: isAnonymous,
              isAnonymousFunc: isAnonymousFunc,
            ),
          )
        ],
      ),
    );
  }
}
