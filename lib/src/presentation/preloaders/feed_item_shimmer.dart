import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:user_feed/src/domain/value_objects/colors.dart';

class FeedItemShimmer extends StatelessWidget {
  const FeedItemShimmer({Key? key, required this.horizontalPadding})
      : super(key: key);

  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Positioned(
            top: 35,
            left: 80,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 20,
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
            top: 60,
            left: 80,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 10,
                    width: 60,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 100,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 20,
            right: 20,
            child: Shimmer.fromColors(
              baseColor: shimmerBaseColor,
              highlightColor: shimmerHighlightColor,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: primaryColor,
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
