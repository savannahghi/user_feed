import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';

class GlobalActionItemShimmerRow extends StatelessWidget {
  const GlobalActionItemShimmerRow({required this.horizontalPadding});

  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
      child: getGlobalActionItemShimmer(context),
    );
  }

  Widget getGlobalActionItemShimmer(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double circleWidth = (width / 3) * 0.8;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: GlobalActionItemShimmer(
            width: circleWidth,
            height: circleWidth,
          ),
        ),
        size15HorizontalSizedBox,
        Expanded(
          child: GlobalActionItemShimmer(
            width: circleWidth,
            height: circleWidth,
          ),
        ),
        size15HorizontalSizedBox,
        Expanded(
          child: GlobalActionItemShimmer(
            width: circleWidth,
            height: circleWidth,
          ),
        ),
      ],
    );
  }
}

class GlobalActionItemShimmer extends StatelessWidget {
  const GlobalActionItemShimmer({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

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
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: primaryColor),
          ),
          smallVerticalSizedBox,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(5)),
            child: const Text(kGetMedicine),
          ),
        ],
      ),
    );
  }
}
