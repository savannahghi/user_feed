import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/src/domain/entities/link.dart';

import 'package:sil_feed/src/domain/value_objects/colors.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/document_viewer/document_grid.dart';
import 'package:sil_feed/src/presentation/image_viewer/image_grid.dart';
import 'package:sil_feed/src/presentation/video_player/video_player.dart';

import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';

class FeedItemBody extends StatelessWidget {
  const FeedItemBody(this.summary,
      {Key? key,
      required this.links,
      required this.text,
      required this.itemTextType})
      : super(key: key);

  final List<Link>? links;
  final String summary;
  final String? text;
  final TextType? itemTextType;

  @override
  Widget build(BuildContext context) {
    // extract images
    final List<Link> images =
        processFeedMedia(links: links, linkType: LinkType.PNG_IMAGE);

    // extract documents
    final List<Link> documents =
        processFeedMedia(links: links, linkType: LinkType.PDF_DOCUMENT);

    // extract videos
    final List<Link> videos =
        processFeedMedia(links: links, linkType: LinkType.YOUTUBE_VIDEO);

    final int remainingImageLength = images.length - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verySmallVerticalSizedBox,

        // the body text of the feed
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                summary,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextThemes.normalSize14Text(),
              ),
              verySmallVerticalSizedBox,
              Text(
                'see more',
                textAlign: TextAlign.left,
                style: TextThemes.normalSize14Text(accentColor),
              ),
            ],
          ),
        ),

        smallVerticalSizedBox,

        // feed item videos are displayed here
        if (videos.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(height: 200, child: VideoPlayer(videos: videos)),
          ),

        // checks that there are actually images
        if (images.isNotEmpty)
          Stack(
            children: <Widget>[
              // use the first image as a cover
              Image.network(images.first.url!),

              // an indicator to show the number of images remaining in the gallery
              if (remainingImageLength != 0 && remainingImageLength > 1)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    key: navigateToPhotos,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<FeedItemImageGrid>(
                          builder: (_) => FeedItemImageGrid(images: images),
                        ),
                      );
                    },
                    child: Container(
                      key: remainingPhotosKey,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        '+ $remainingImageLength more photos',
                        style: TextThemes.boldSize14Text(Colors.white),
                      ),
                    ),
                  ),
                )
            ],
          ),

        smallVerticalSizedBox,

        // attachments; grid of thumbnails with footer (document title, subtitle)
        if (documents.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              key: navigateToDocuments,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<FeedItemDocumentGrid>(
                    builder: (_) => FeedItemDocumentGrid(documents: documents),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: primaryColor, width: 0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // attachment icon container
                        Container(
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          padding: const EdgeInsets.all(15),
                          child: const Icon(Icons.attach_file,
                              color: Colors.white, size: 35),
                        ),
                        smallHorizontalSizedBox,

                        // title and subtitle container
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Documents (${documents.length})',
                                  style: TextThemes.boldSize15Text()),
                              verySmallVerticalSizedBox,
                              Text(
                                tapToViewString,
                                style: TextThemes.boldSize14Text(Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // view icon
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Icon(CupertinoIcons.right_chevron,
                          color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
