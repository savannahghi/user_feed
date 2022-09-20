// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/colors.dart';

// Project imports:
import 'package:user_feed/src/domain/value_objects/asset_strings.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';

class FeedZeroState extends StatelessWidget {
  const FeedZeroState({super.key, required this.subtitle});

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
