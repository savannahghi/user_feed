import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/domain/entities/item.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/colors.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_body.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_detail_view.dart';
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
    final String summary = feedItem.summary!;
    final String iconUrl = feedItem.icon!.url!;
    final String timestamp = getHumanReadableTimestamp(feedItem.timestamp!);

    /// for the [FeedItemBody]
    ///
    /// - links contain a mixture of docs, images and videos
    final List<Link>? links = feedItem.links;

    // the long text
    final String? text = feedItem.text;

    final TextType? itemTextType = feedItem.textType;

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<FeedItemContentView>(
            builder: (_) => FeedItemContentView(
              links: links,
              text: text,
              summary: summary,
              itemTextType: itemTextType,
              feedItem: feedItem,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: lightGreyColor, width: 0.5),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 0.5,
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
                    timestamp: timestamp,
                    iconUrl: iconUrl,
                    itemID: feedItemID,
                  ),
                ),

                // the body of the feed item
                FeedItemBody(
                  summary,
                  links: links,
                  text: text,
                  itemTextType: itemTextType,
                ),
                smallVerticalSizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
