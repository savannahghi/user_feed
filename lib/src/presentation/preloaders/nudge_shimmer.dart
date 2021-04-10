import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sil_feed/src/domain/value_objects/colors.dart';

class NudgeShimmer extends StatelessWidget {
  const NudgeShimmer({required this.padding});

  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      child: Padding(
        padding: EdgeInsets.all(padding!),
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
