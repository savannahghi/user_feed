import 'package:flutter/material.dart';
import 'package:sil_feed/src/domain/value_objects/asset_strings.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';

import 'package:sil_themes/colors.dart';

class FeedZeroState extends StatelessWidget {
  const FeedZeroState({Key? key, required this.subtitle}) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final double subtitleWidth = MediaQuery.of(context).size.width * 0.7;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          zeroStateUrl,
          package: packageName,
          height: MediaQuery.of(context).size.longestSide * 0.50,
          width: MediaQuery.of(context).size.shortestSide,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          child: Text(
            nothingToSee,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        SizedBox(
          width: subtitleWidth,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(color: black54),
          ),
        ),
      ],
    );
  }
}
