import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sil_feed/shared/utils/colors.dart';
import 'package:sil_themes/spaces.dart';

class FeedLoadingShimmer extends StatelessWidget {
  const FeedLoadingShimmer({Key key, @required this.flavor}) : super(key: key);

  final String flavor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Column(
        children: <Widget>[
          // global actions
          if (flavor != 'PRO') ...<Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GlobalActionItemShimmer(),
                  GlobalActionItemShimmer(),
                  GlobalActionItemShimmer(),
                ],
              ),
            ),
          ],

          mediumVerticalSizedBox,
          // nudges
          NudgeShimmer(),

          mediumVerticalSizedBox,

          // feed items
          FeedItemShimmer(),
          mediumVerticalSizedBox,
        ],
      ),
    );
  }
}

class GlobalActionItemShimmer extends StatelessWidget {
  const GlobalActionItemShimmer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
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
            child: Text('GET MEDICINE'),
          ),
        ],
      ),
    );
  }
}

class NudgeShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
