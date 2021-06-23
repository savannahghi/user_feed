import 'package:flutter/material.dart';

import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/domain/value_objects/feed_store.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

class FeedItemCoverCallToAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Function>? coverCallbacks =
        FeedStore().feedContentCallbacks.valueOrNull;

    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: coverCallToActionColor,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: coverCallToActionColor,
            gradient: LinearGradient(
                colors: <Color>[
                  coverCallToActionColor,
                  white.withOpacity(0.1),
                  coverCallToActionColor.withOpacity(0.8)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const <double>[0.4, 0.6, 0.7])),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              coverCallToActionTitle,
              style: TextThemes.heavySize20Text(Colors.white),
            ),
            smallVerticalSizedBox,
            Text(
              viewCoverCallToActionBody,
              style: TextThemes.normalSize15Text(Colors.white)
                  .copyWith(height: 1.4),
            ),
            mediumVerticalSizedBox,
            SILPrimaryButton(
              onPressed: () {
                coverCallbacks![kAddInsurance]!();
              },
              text: addInsurance,
              borderColor: white.withOpacity(0.9),
              buttonColor: white.withOpacity(0.9),
              customPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              textColor: coverCallToActionColor,
            )
          ],
        ),
      ),
    );
  }
}
