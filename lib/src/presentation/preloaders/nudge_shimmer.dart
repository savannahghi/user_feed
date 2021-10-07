// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shimmer/shimmer.dart';

// Project imports:
import 'package:user_feed/src/domain/value_objects/colors.dart';

class NudgeShimmer extends StatelessWidget {
  const NudgeShimmer({required this.padding});

  final double? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Column(
              children: <Widget>[
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 25,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 20,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
