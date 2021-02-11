import 'package:flutter/material.dart';
import 'package:sil_feed/shared/utils/strings.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/widget_keys.dart';
import 'package:sil_themes/spaces.dart';

class FeedItemCommentCard extends StatelessWidget {
  const FeedItemCommentCard({
    Key key,
    @required this.senderName,
    @required this.threadBody,
    @required this.timeStamp,
  }) : super(key: key);

  final String senderName;
  final String threadBody;
  final String timeStamp;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: feedItemCommentCard,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              key: iconAvatarContainer,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(FeedItemStrings.fallbackLogoIconUrl),
                    fit: BoxFit.fill),
                // color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            smallHorizontalSizedBox,
            Expanded(
              child: Column(
                key: senderReplyColumn,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    senderName ?? 'Sender name',
                    style: TextThemes.veryBoldSize14Text(Colors.black87),
                  ),
                  verySmallVerticalSizedBox,
                  Text(threadBody ?? 'Some body message',
                      overflow: TextOverflow.visible,
                      style: TextThemes.normalSize12Text(Colors.black87)),
                  smallVerticalSizedBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      timeStamp ?? 'Nov, 2020',
                      overflow: TextOverflow.visible,
                      style: TextThemes.normalSize10Text(Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
