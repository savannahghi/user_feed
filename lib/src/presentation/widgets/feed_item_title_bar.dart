// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:user_feed/src/application/helpers/utils.dart';

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
    Key? key,
    required this.author,
    required this.timestamp,
    required this.iconUrl,
    required this.itemID,
  }) : super(key: key);

  final String author;
  final String iconUrl;
  final String itemID;
  final String timestamp;

  String postTimeStampAsMessage(String? timestamp) {
    if (timestamp == null) return '';
    return timestamp;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // icon or avatar
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black87),
            gradient: getFeedGlobalActionGradient(context),
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(iconUrl),
            ),
          ),
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
                      style: TextThemes.boldSize15Text(Colors.black87)),
                  extremelySmallVerticalSizedBox,

                  // the date
                  Container(
                    constraints: const BoxConstraints(maxWidth: 180),
                    child: // a formatted human readable timestamp
                        Text(
                      this.postTimeStampAsMessage(timestamp),
                      style: TextThemes.normalSize12Text(grey),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
