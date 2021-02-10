import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/features/document_viewer/pages/document_grid.dart';
import 'package:sil_feed/features/image_viewer/image_grid.dart';
import 'package:sil_feed/features/video_player/video_player.dart';
import 'package:sil_feed/shared/utils/colors.dart';
import 'package:sil_feed/shared/utils/sizing.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';

// ignore_for_file: todo
class FeedItemBody extends StatelessWidget {
  const FeedItemBody(
      {Key key,
      @required this.links,
      this.summary,
      @required this.text,
      @required this.flavour})
      : super(key: key);

  final String flavour;
  final List<dynamic> links;
  final String summary;
  final String text;

  @override
  Widget build(BuildContext context) {
    /// TODO(abiud): process the images, docs and videos here.
    ///
    /// - this should be moved to a shared location like utils

    // extract images
    final List<dynamic> images =
        FeedUtils.processFeedMedia(links: links, mediaType: MediaType.pngImage);

    // extract documents
    final List<dynamic> documents = FeedUtils.processFeedMedia(
        links: links, mediaType: MediaType.pdfDocument);

    // extract videos
    final List<dynamic> videos = FeedUtils.processFeedMedia(
        links: links, mediaType: MediaType.youtubeVideo);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        smallVerticalSizedBox,

        // the text
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            text ?? '',
            style: TextThemes.normalSize15Text(Colors.black),
          ),
        ),

        smallVerticalSizedBox,

        if (videos.isNotEmpty)
          Container(height: 200, child: VideoPlayer(videos: videos)),

        // checks that there are actually images
        if (images.isNotEmpty)
          Stack(
            children: <Widget>[
              Image.network(images?.first['url']),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute<FeedItemImageGrid>(
                      builder: (_) =>
                          FeedItemImageGrid(images: images, flavour: flavour),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      // TODO(abiud): check for when the image is only one
                      '+ ${images.length - 1} more photos',
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
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute<FeedItemDocumentGrid>(
                  builder: (_) => FeedItemDocumentGrid(
                    documents: documents,
                    flavour: flavour,
                  ),
                ));
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
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Icon(Icons.attach_file,
                                color: Colors.white, size: 35),
                            padding: EdgeInsets.all(15),
                          ),
                          smallHorizontalSizedBox,

                          // title and subtitle container
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Documents',
                                  style: TextThemes.boldSize15Text(),
                                ),
                                verySmallVerticalSizedBox,
                                Text(
                                  // TODO(abiud): check for less that one document
                                  '${documents.length} documents | Tap to view',
                                  style: TextThemes.boldSize14Text(Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ]),

                    // view icon
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
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
