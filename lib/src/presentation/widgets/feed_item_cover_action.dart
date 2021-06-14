import 'package:flutter/material.dart';

import 'package:sil_feed/src/domain/value_objects/colors.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/feed_store.dart';
import 'package:sil_themes/colors.dart';
import 'package:sil_themes/spaces.dart';
import 'package:sil_ui_components/sil_buttons.dart';

class FeedItemCoverCallToAction extends StatelessWidget {
  const FeedItemCoverCallToAction({Key? key, required this.hasCover})
      : super(key: key);

  final bool hasCover;

  @override
  Widget build(BuildContext context) {
    final Map<String, Function>? coverCallbacks =
        FeedStore().feedContentCallbacks.valueOrNull;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: coverCallToActionColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        hasCover
                            ? viewCoverCallToActionTitle
                            : coverCallToActionTitle,
                        style: const TextStyle(
                          color: white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      smallVerticalSizedBox,
                      Text(
                        hasCover
                            ? viewCoverCallToActionBody
                            : coverCallToActionBody,
                        style: const TextStyle(
                          color: white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mediumVerticalSizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SILSecondaryButton(
                  onPressed: () {
                    final Function? call = hasCover
                        ? coverCallbacks![kViewCover]
                        : coverCallbacks![kAddInsurance];
                    call!();
                  },
                  text: hasCover ? viewCover : addInsurance,
                  borderColor: white,
                  buttonColor: coverCallToActionColor,
                  textColor: white,
                ),
                SILPrimaryButton(
                  onPressed: () {
                    final Function? call = coverCallbacks![kBuyInsurance];
                    call!();
                  },
                  text: buyInsurance,
                  buttonColor: white,
                  textColor: coverCallToActionColor,
                  borderColor: white,
                  customPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  customElevation: 0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
