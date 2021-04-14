import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/domain/entities/item.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_body.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_title_bar.dart';

import 'package:sil_themes/spaces.dart';

class FeedItemComponent extends StatelessWidget {
  const FeedItemComponent({required this.feedItem});

  final Item feedItem;

  @override
  Widget build(BuildContext context) {
    /// for the [FeedItemTitleBar]
    final String feedItemID = feedItem.id!;
    final String author = feedItem.author!;
    final String tagline = feedItem.tagline!;
    final String iconUrl = feedItem.icon!.url!;
    final String timestamp = getHumanReadableTimestamp(feedItem.timestamp!);

    /// for the [FeedItemBody]
    ///
    /// - links contain a mixture of docs, images and videos
    final List<Link> links = feedItem.links!;

    // the long text
    final String text = feedItem.text!;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
      ),
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              smallVerticalSizedBox,
              // the title bar of the feed item
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: FeedItemTitleBar(
                  author: author,
                  tagline: tagline,
                  timestamp: timestamp,
                  iconUrl: iconUrl,
                  itemID: feedItemID,
                ),
              ),

              // the body of the feed item
              FeedItemBody(links: links, text: text),
              smallVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
