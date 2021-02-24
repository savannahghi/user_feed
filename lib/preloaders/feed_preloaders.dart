import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:sil_feed/shared/utils/colors.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_misc/responsive_widget.dart';
import 'package:sil_themes/spaces.dart';

class FeedLoadingShimmer extends StatelessWidget {
  const FeedLoadingShimmer({Key key, @required this.flavor}) : super(key: key);

  final String flavor;

  @override
  Widget build(BuildContext context) {
    double pagePadding = ResponsiveWidget.isSmallScreen(context) ? 16 : 20;

    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Column(
        children: <Widget>[
          // global actions
          if (flavor != professionalFlavor) ...<Widget>[
            GlobalActionItemShimmerRow(horizontalPadding: pagePadding),
          ],

          mediumVerticalSizedBox,
          // nudges
          NudgeShimmer(padding: pagePadding),

          mediumVerticalSizedBox,

          // feed items
          FeedItemShimmer(horizontalPadding: pagePadding),
          mediumVerticalSizedBox,
        ],
      ),
    );
  }
}

class GlobalActionItemShimmerRow extends StatelessWidget {
  final double horizontalPadding;

  const GlobalActionItemShimmerRow({@required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: getGlobalActionItemShimmer(context),
    );
  }

  Widget getGlobalActionItemShimmer(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double circleWidth = (width / 3) * 0.8;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GlobalActionItemShimmer(
          width: circleWidth,
          height: circleWidth,
        ),
        GlobalActionItemShimmer(
          width: circleWidth,
          height: circleWidth,
        ),
        GlobalActionItemShimmer(
          width: circleWidth,
          height: circleWidth,
        ),
      ],
    );
  }
}

class GlobalActionItemShimmer extends StatelessWidget {
  final double width;
  final double height;

  const GlobalActionItemShimmer({
    Key key,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Column(
        children: <Widget>[
          Container(
            height: width,
            width: height,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: primaryColor),
          ),
          smallVerticalSizedBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: primaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: Text(kGetMedicine),
          ),
        ],
      ),
    );
  }
}

class NudgeShimmer extends StatelessWidget {
  final double padding;

  const NudgeShimmer({@required this.padding});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedItemShimmer extends StatelessWidget {
  final double horizontalPadding;

  const FeedItemShimmer({Key key, @required this.horizontalPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
