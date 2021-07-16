import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_feed/src/domain/entities/link.dart';

import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/src/application/helpers/utils.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/image_viewer/image_grid.dart';
import 'package:user_feed/src/presentation/video_player/video_player.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class FeedItemBody extends StatefulWidget {
  const FeedItemBody(
    this.summary, {
    Key? key,
    required this.links,
    required this.text,
    required this.itemTextType,
    required this.videos,
  }) : super(key: key);

  final List<Link>? links;
  final String summary;
  final String? text;
  final TextType? itemTextType;
  final List<Link>? videos;

  @override
  FeedItemBodyState createState() => FeedItemBodyState();
}

class FeedItemBodyState extends State<FeedItemBody> {
  List<Link>? images;

  List<Link>? documents;

  int? remainingImageLength;

  @override
  void initState() {
    // extract images
    images =
        processFeedMedia(links: widget.links, linkType: LinkType.PNG_IMAGE);

    // extract documents
    // documents =
    //     processFeedMedia(links: widget.links, linkType: LinkType.PDF_DOCUMENT);

    remainingImageLength = images!.length - 1;

    super.initState();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return feedItemBodyState;
  }

  void navigateToImagesGrid() {
    Navigator.of(context).push(
      MaterialPageRoute<FeedItemImageGrid>(
        builder: feedItemImageGridNavBuilder,
      ),
    );
  }

  Widget feedItemImageGridNavBuilder(BuildContext context) {
    return FeedItemImageGrid(images: images!);
  }

  @override
  Widget build(BuildContext context) {
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
                widget.summary,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextThemes.normalSize13Text().copyWith(
                  wordSpacing: 0.6,
                  height: 1.5,
                ),
              ),
              extremelySmallVerticalSizedBox,
              if (widget.videos!.isEmpty)
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '...see more',
                    textAlign: TextAlign.left,
                    style: TextThemes.normalSize12Text(accentColor),
                  ),
                ),
            ],
          ),
        ),
        smallVerticalSizedBox,
        // feed item videos are displayed here
        if (widget.videos!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
                height: 200, child: VideoPlayer(videos: widget.videos!)),
          ),

        // checks that there are actually images
        if (images!.isNotEmpty)
          Stack(
            children: <Widget>[
              // use the first image as a cover
              Image.network(images!.first.url!),

              // an indicator to show the number of images remaining in the gallery
              if (remainingImageLength != 0 && remainingImageLength! > 1)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    key: navigateToPhotos,
                    onTap: navigateToImagesGrid,
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
      ],
    );
  }
}
