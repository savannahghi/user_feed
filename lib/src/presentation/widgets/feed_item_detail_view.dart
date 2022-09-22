// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:user_feed/src/application/helpers/utils.dart';
import 'package:user_feed/src/domain/entities/item.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/user_feed.dart';

class FeedItemContentView extends StatefulWidget {
  const FeedItemContentView(
      {super.key,
      required this.feedItem,
      required this.text,
      required this.itemTextType,
      required this.summary,
      required this.videos,
      this.featureImage,
      this.links});
  final Item feedItem;

  final String summary;
  final String? text;
  final TextType? itemTextType;
  final List<Link?>? links;
  final List<Link?>? videos;
  final String? featureImage;

  @override
  FeedItemContentViewState createState() => FeedItemContentViewState();
}

class FeedItemContentViewState extends State<FeedItemContentView> {
  void onBodyLinkOrImageTapCallback(String? url, RenderContext context,
      Map<String, String> attributes, dom.Element? element) {
    final Uri _url = Uri.parse(url!);
    launchUrl(_url);
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
        data: widget.text,
        onLinkTap: onBodyLinkOrImageTapCallback,
        onImageTap: onBodyLinkOrImageTapCallback,
        style: <String, Style>{
          'li': Style(
            lineHeight: LineHeight.em(1.5),
            fontWeight: FontWeight.bold,
            color: greyColor,
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
                    if (widget.videos != null && widget.videos!.isNotEmpty)
                      const SizedBox(),
                    if (widget.featureImage != '')
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: SizedBox(
                          child: Image.network(
                            widget.featureImage!,
                            fit: BoxFit.fitWidth,
                          ),
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
