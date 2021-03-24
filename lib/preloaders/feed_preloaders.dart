import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sil_feed/preloaders/feed_item_shimmer.dart';
import 'package:sil_feed/preloaders/global_action_item_shimmer.dart';
import 'package:sil_feed/preloaders/nudge_shimmer.dart';

import 'package:sil_feed/shared/utils/colors.dart';
import 'package:sil_feed/constants/constants.dart';

import 'package:sil_themes/spaces.dart';

class FeedLoadingShimmer extends StatelessWidget {
  const FeedLoadingShimmer(
      {Key? key,
      required this.flavor,
      required this.globalActionShimmerHorizontalPadding,
      required this.nudgeShimmerPadding,
      required this.feedItemShimmerPadding})
      : super(key: key);

  final String flavor;
  final double globalActionShimmerHorizontalPadding;
  final double nudgeShimmerPadding;
  final double feedItemShimmerPadding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Column(
        children: <Widget>[
          // global actions
          if (flavor != professionalFlavor) ...<Widget>[
            GlobalActionItemShimmerRow(
                horizontalPadding: globalActionShimmerHorizontalPadding),
          ],

          mediumVerticalSizedBox,
          // nudges
          NudgeShimmer(
            padding: nudgeShimmerPadding,
          ),

          mediumVerticalSizedBox,

          // feed items
          FeedItemShimmer(
            horizontalPadding: feedItemShimmerPadding,
          ),
          mediumVerticalSizedBox,
        ],
      ),
    );
  }
}
