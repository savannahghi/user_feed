import 'package:flutter/material.dart';
import 'package:sil_feed/shared/typedefs/feed_typedefs.dart';
import 'package:sil_feed/shared/widgets/feed_item_component.dart';

/// holds all the feed components together
///
/// - takes in a list of feed items and renders the ui based on that
class FeedItemsWrapper extends StatelessWidget {
  const FeedItemsWrapper(
      {Key key,
      @required this.feedItems,
      @required this.flavour,
      this.isAnonymousFunc,
      @required this.resolveFunction,
      @required this.pinFunction,
      @required this.hideFunction,
      @required this.tetherThread,
      @required this.postedByUID,
      @required this.postedByName})
      : super(key: key);

  final List<dynamic> feedItems;
  final String flavour;
  final String postedByUID;
  final bool tetherThread;
  final String postedByName;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  final feedItemActionTypeDef resolveFunction;
  final feedItemActionTypeDef pinFunction;
  final feedItemActionTypeDef hideFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...feedItems.map(
          (dynamic feeditem) => FeedItemComponent(
            postedByName: postedByName,
            postedByUID: postedByUID,
            feedItem: feeditem,
            flavour: flavour,
            resolveFunction: resolveFunction,
            pinFunction: pinFunction,
            hideFunction: hideFunction,
            tetherThread: tetherThread,
          ),
        )
      ],
    );
  }
}
