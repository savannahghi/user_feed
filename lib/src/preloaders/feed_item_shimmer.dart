import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sil_feed/src/shared/utils/colors.dart';

class FeedItemShimmer extends StatelessWidget {
  const FeedItemShimmer({Key? key, required this.horizontalPadding})
      : super(key: key);

  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
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
