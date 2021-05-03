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
import 'package:sil_feed/src/presentation/video_player/video_player.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_title_bar.dart';
import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedItemContentView extends StatefulWidget {
  const FeedItemContentView(
      {Key? key,
      required this.feedItem,
      required this.text,
      required this.itemTextType,
      required this.summary,
      required this.videos,
      this.links})
      : super(key: key);
  final Item feedItem;

  final String summary;
  final String? text;
  final TextType? itemTextType;
  final List<Link>? links;
  final List<Link> videos;

  @override
  FeedItemContentViewState createState() => FeedItemContentViewState();
}

class FeedItemContentViewState extends State<FeedItemContentView> {
  void onBodyLinkOrImageTapCallback(String? url, RenderContext context,
      Map<String, String> attributes, dom.Element? element) {
    launch(url!);
  }

  Widget bodyContent() {
    /// the contains bit is a cheap hack to allow the frontend correctly identify if the text from the backend
    /// has html tags. it should be retired once the backend conforms to the feed schema and provide [itemTextType]
    /// in the data
    if (widget.itemTextType == TextType.HTML ||
        widget.text!.contains('<p>') ||
        widget.text!.contains('</p>') ||
        widget.text!.contains('<ul>') ||
        widget.text!.contains('</ul>')) {
      return Html(
        data: widget.text!,
        onLinkTap: onBodyLinkOrImageTapCallback,
        onImageTap: onBodyLinkOrImageTapCallback,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        widget.text ?? UNKNOWN,
        style: TextThemes.normalSize14Text(Colors.black.withOpacity(0.6)),
      ),
    );
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return feedItemContentViewState;
  }

  void navigateWithPopCallback() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final String feedItemID = widget.feedItem.id!;
    final String author = widget.feedItem.author!;
    final String tagline = removeHyphens(widget.feedItem.tagline!)!;
    final String iconUrl = widget.feedItem.icon!.url!;
    final String timestamp =
        getHumanReadableTimestamp(widget.feedItem.timestamp!);

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
          onPressed: navigateWithPopCallback,
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
                    if (widget.videos.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: 200,
                          child: VideoPlayer(videos: widget.videos),
                        ),
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
