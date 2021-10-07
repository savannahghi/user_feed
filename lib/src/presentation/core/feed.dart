library sil_feed;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:user_feed/src/application/helpers/utils.dart';
import 'package:user_feed/src/domain/entities/feed.dart';
import 'package:user_feed/src/domain/entities/item.dart';
import 'package:user_feed/src/domain/entities/nudge.dart';
import 'package:user_feed/src/domain/resources/inputs.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/domain/value_objects/feed_store.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/widgets/feed_cover_mini_card.dart';
import 'package:user_feed/src/presentation/widgets/feed_item_component.dart';
import 'package:user_feed/src/presentation/widgets/nudge_carousel.dart';

class FeedComponent extends StatefulWidget {
  const FeedComponent({
    Key? key,
    required this.userFeed,
    required this.flavour,
    required this.isSmallScreen,
    required this.feedContentCallbacks,
    this.profileProgress,
    this.setupComplete = false,
    this.covers,
    this.feedbackGroundColor,
  }) : super(key: key);

  /// the feed
  final FeedResponsePayload userFeed;

  /// The flavour in which the app is running on
  final Flavour flavour;

  /// If this app is running on a small screen
  final bool isSmallScreen;

  /// profile progress for `PRO`
  final String? profileProgress;

  /// [setupComplete] indicated whether setup is complete. Valid only for `PRO`
  final bool setupComplete;

  /// Callbacks(functions) that will be used in the feed items
  final Map<String, Function> feedContentCallbacks;

  /// Feed background color
  final Color? feedbackGroundColor;

  /// indicates if the user has a cover `CONSUMER`
  final List<dynamic>? covers;

  @override
  _FeedComponentState createState() => _FeedComponentState();
}

class _FeedComponentState extends State<FeedComponent> {
  @override
  void initState() {
    super.initState();
    FeedStore()
      ..feedContentCallbacks.add(widget.feedContentCallbacks)
      ..flavour.add(widget.flavour);
  }

  @override
  Widget build(BuildContext context) {
    final Feed feed = this.widget.userFeed.data.getFeed;

    // nudges
    final List<Nudge> feedNudges = feed.nudges!;

    // feed items
    final List<Item> feedItems = feed.items!;

    Widget showProfileSetupProgress(Flavour flavour,
        {required bool setupComplete}) {
      if (flavour == Flavour.PRO || setupComplete) {
        return Container(
          margin: const EdgeInsets.all(4),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: const <BoxShadow>[
              BoxShadow(color: Colors.black54, blurRadius: 0.3)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  completeProfileTitle,
                  style: TextThemes.veryBoldSize16Text(),
                ),
                size15VerticalSizedBox,
                Text(
                  displayProgress(widget.profileProgress),
                  style: TextThemes.normalSize14Text(Colors.grey),
                ),
                size15VerticalSizedBox,
              ],
            ),
          ),
        );
      }
      return const SizedBox();
    }

    // show the call to action widget where the user is prompted to add or buy cover
    Widget showCallToAction() {
      if (widget.covers != null && widget.covers!.isNotEmpty) {
        return CoverMiniCard(
          cover: widget.covers![0],
        );
      }

      return const SizedBox.shrink();
    }

    return ListView(
      shrinkWrap: true,
      key: feedComponentKey,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          decoration: BoxDecoration(color: widget.feedbackGroundColor),
          margin: const EdgeInsets.only(top: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // profile progress indicator for pro
              if (!widget.setupComplete)
                showProfileSetupProgress(widget.flavour,
                    setupComplete: widget.setupComplete),
              if (widget.flavour == Flavour.CONSUMER) showCallToAction(),
              if (feedNudges.isEmpty)
                mediumVerticalSizedBox
              else
                NudgeCarousel(
                  nudges: feedNudges,
                  single: false,
                  unroll: false,
                  isSmallScreen: widget.isSmallScreen,
                ),

              ...feedItems
                  .map((Item feedItem) => FeedItemComponent(feedItem: feedItem))
            ],
          ),
        ),
      ],
    );
  }
}
