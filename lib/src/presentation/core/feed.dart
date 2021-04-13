library sil_feed;

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/entities/action.dart' as feed_action;
import 'package:sil_feed/src/domain/entities/feed.dart';
import 'package:sil_feed/src/domain/entities/item.dart';
import 'package:sil_feed/src/domain/entities/nudge.dart';
import 'package:sil_feed/src/domain/resources/inputs.dart';
import 'package:sil_feed/src/domain/value_objects/asset_strings.dart';
import 'package:sil_feed/src/domain/value_objects/colors.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/feed_type_defs.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/widgets/feed_global_action_bar.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_wrapper.dart';
import 'package:sil_feed/src/presentation/widgets/nudge_carousel.dart';

import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';

class FeedComponent extends StatelessWidget {
  const FeedComponent({
    Key? key,
    required this.userFeed,
    required this.flavour,
    required this.isSmallScreen,
    required this.tetherThread,
    required this.resolveFunction,
    required this.pinFunction,
    required this.hideFunction,
    required this.postedByUID,
    required this.postedByName,
    // TODO(abiud): add the others ie pin and hide
    required this.isAnonymousFunc,
    required this.feedContentCallbacks,
    this.profileProgress,
    this.setupComplete = false,
    this.replyToFeedItemFunction,
  }) : super(key: key);

  /// the feed
  final FeedResponsePayload userFeed;
  final Flavour flavour;
  final bool isSmallScreen;
  final bool tetherThread;

  ///profile progress for `PRO`
  final String? profileProgress;

  /// [setupComplete] indicated whether setup is complete. Valid only for `PRO`
  final bool setupComplete;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  /// [postedByUID] uid of the currently logged in user
  final String postedByUID;

  /// [postedByName] name of the currently logged in user
  final String postedByName;

  /// callbacks that will be used in the feed items
  final Map<String, Function> feedContentCallbacks;

  final feedItemActionTypeDef resolveFunction;

  final feedItemActionTypeDef pinFunction;

  final feedItemActionTypeDef hideFunction;

  final replyToFeedItemTypeDef? replyToFeedItemFunction;

  // TODO(abiud): add others eg hide and pin, unpin

  @override
  Widget build(BuildContext context) {
    final Feed feed = this.userFeed.data.getFeed;

    // check if the user is anonymous
    final bool isAnonymous = feed.isAnonymous!;

    // global actions
    final List<feed_action.Action>? feedActions = feed.actions;

    final List<feed_action.Action> otherActions = feedActions!
        .where((feed_action.Action actionItem) =>
            actionItem.actionType != ActionType.FLOATING)
        .toList();

    // nudges
    final List<Nudge> feedNudges = feed.nudges!;

    // feed items
    final List<Item> feedItems = feed.items!;

    Widget showGlobalActionsBar(Flavour flavour) {
      if (flavour == Flavour.CONSUMER) {
        return FeedGlobalActionBar(
          globalActionsData: otherActions,
          flavour: flavour,
          isAnonymousFunc: this.isAnonymousFunc,
          isAnonymous: isAnonymous,
        );
      }
      return const SizedBox();
    }

    Widget showProfileSetupProgress(Flavour flavour,
        {required bool setupComplete}) {
      if (flavour == Flavour.PRO || setupComplete) {
        return Container(
          margin: const EdgeInsets.all(15),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 0.3,
              )
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
                  displayProgress(profileProgress),
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

    /// [swipeMoreControl] shows the swipe more control for [consumer]
    Widget swipeMoreControl(Flavour flavour) {
      if (flavour == Flavour.CONSUMER) {
        return Container(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SvgPicture.asset(
                swipeForMoreIconUrl,
                package: packageName,
              ),
              Text(
                swipeForMore,
                style: TextThemes.normalSize14Text(Colors.black87),
              )
            ],
          ),
        );
      }
      return const SizedBox();
    }

    return ListView(
      shrinkWrap: true,
      key: feedComponentKey,
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        smallVerticalSizedBox,
        Container(
          decoration: const BoxDecoration(color: backgroundColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /// feed global actions bar
              showGlobalActionsBar(flavour),

              /// the swipe for more icon below the feed global action bar
              ///
              /// - Used to indicate to the user that there are more actions other
              /// than the ones displayed in the screen
              ///
              /// todo(future) - hide this if there are no items in the screen
              swipeMoreControl(flavour),

              // profile progress indicator for pro
              showProfileSetupProgress(flavour, setupComplete: setupComplete),

              NudgeCarousel(
                nudges: feedNudges,
                flavour: flavour,
                isAnonymousFunc: this.isAnonymousFunc,
                isAnonymous: isAnonymous,
                single: false,
                unroll: false,
                isSmallScreen: isSmallScreen,
                nudgeCarouselCallbacks: feedContentCallbacks,
              ),

              // feed item wrapper contains a list of all the feed items
              FeedItemsWrapper(
                postedByName: postedByName,
                postedByUID: postedByUID,
                feedItems: feedItems,
                flavour: flavour,
                tetherThread: tetherThread,
                resolveFunction: resolveFunction,
                pinFunction: pinFunction,
                hideFunction: hideFunction,
                isAnonymous: isAnonymous,
                isAnonymousFunc: isAnonymousFunc,
              )
            ],
          ),
        ),
      ],
    );
  }
}