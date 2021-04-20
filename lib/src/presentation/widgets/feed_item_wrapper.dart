import 'package:flutter/material.dart';
import 'package:sil_feed/src/domain/entities/item.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_component.dart';

/// holds all the feed components together
///
/// - takes in a list of feed items and renders the ui based on that list
class FeedItemsWrapper extends StatelessWidget {
  const FeedItemsWrapper({Key? key, required this.feedItems}) : super(key: key);

  final List<Item> feedItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: <Widget>[
          ...feedItems.map(
            (Item feedItem) => FeedItemComponent(feedItem: feedItem),
          )
        ],
      ),
    );
  }
}
