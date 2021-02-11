import 'package:flutter/material.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_themes/spaces.dart';

/// the top bar of the feed item
///
/// it contains the following
///
/// - an icon
/// - a tagline
/// - a timestamp
/// - an optional label
class FeedItemTitleBar extends StatelessWidget {
  const FeedItemTitleBar({
    Key key,
    @required this.author,
    @required this.tagline,
    @required this.timestamp,
    @required this.iconUrl,
    @required this.itemID,
  }) : super(key: key);

  final String author;
  final String iconUrl;
  final String itemID;
  final String tagline;
  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // icon or avatar
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black87, width: 1),
              gradient: getFeedGlobalActionGradient(context),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(iconUrl))),
        ),

        Flexible(
          child: Row(
            children: <Widget>[
              smallHorizontalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // the author
                  Text(author,
                      style: TextThemes.boldSize16Text(Colors.black87)),
                  extremelySmallVerticalSizedBox,

                  // the tagline
                  Container(
                    constraints: BoxConstraints(maxWidth: 180),
                    child: Text(
                      tagline,
                      style: TextThemes.normalSize14Text(Colors.black54),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  extremelySmallVerticalSizedBox,

                  // a formatted human readable timestamp
                  Text(timestamp ?? 'Just now',
                      style: TextThemes.normalSize12Text(
                          Colors.black.withOpacity(0.4)))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
