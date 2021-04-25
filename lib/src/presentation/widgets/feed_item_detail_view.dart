import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:html/dom.dart' as dom;
import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/entities/item.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/colors.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_title_bar.dart';
import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedItemContentView extends StatelessWidget {
  const FeedItemContentView({
    Key? key,
    required this.feedItem,
    required this.links,
    required this.text,
    required this.itemTextType,
    required this.summary,
  }) : super(key: key);
  final Item feedItem;

  final List<Link>? links;
  final String summary;
  final String? text;
  final TextType? itemTextType;

  Widget bodyContent() {
    /// the contains bit is a cheap hack to allow the frontend correctly identify if the text from the backend
    /// has html tags. it should be retired once the backend conforms to the feed schema and provide [itemTextType]
    /// in the data
    if (this.itemTextType == TextType.HTML ||
        text!.contains('<p>') ||
        text!.contains('</p>') ||
        text!.contains('<ul>') ||
        text!.contains('</ul>')) {
      return Html(
        data: this.text!,
        onLinkTap: (String? url, RenderContext context,
            Map<String, String> attributes, dom.Element? element) {
          launch(url!);
        },
        onImageTap: (String? url, RenderContext context,
            Map<String, String> attributes, dom.Element? element) {
          launch(url!);
        },
        style: <String, Style>{
          'li': Style(
            lineHeight: LineHeight.em(1.5),
            fontWeight: FontWeight.bold,
            color: greyColor,
            display: Display.LIST_ITEM,
            listStylePosition: ListStylePosition.INSIDE,
          ),
          'a': Style(
            textDecoration: TextDecoration.none,
          ),
          'p': Style(
            lineHeight: LineHeight.em(1.5),
            letterSpacing: 0.4,
          ),
        },
      );
    }

    return Text(
      text ?? UNKNOWN,
      style: TextThemes.normalSize14Text(Colors.black.withOpacity(0.6)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String feedItemID = feedItem.id!;
    final String author = feedItem.author!;
    final String tagline = removeHyphens(feedItem.tagline!)!;
    final String iconUrl = feedItem.icon!.url!;
    final String timestamp = getHumanReadableTimestamp(feedItem.timestamp!);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              verySmallVerticalSizedBox,
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FeedItemTitleBar(
                      author: author,
                      timestamp: timestamp,
                      iconUrl: iconUrl,
                      itemID: feedItemID,
                    ),
                    mediumVerticalSizedBox,
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tagline,
                            style: TextThemes.boldSize24Text(),
                            textAlign: TextAlign.start,
                          ),
                          verySmallVerticalSizedBox,
                        ],
                      ),
                    ),
                    smallVerticalSizedBox,
                    bodyContent(),
                    largeVerticalSizedBox,
                    Container(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(children: <Widget>[
                        Text(
                          'Sourced from',
                          style: TextThemes.normalSize12Text(greyColor),
                          textAlign: TextAlign.start,
                        ),
                        verySmallHorizontalSizedBox,
                        GestureDetector(
                          onTap: () => launch('https://www.nhs.uk/live-well/'),
                          child: Text(
                            'The NHS Website',
                            style: TextThemes.normalSize12Text(darkBlueColor),
                            textAlign: TextAlign.start,
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
