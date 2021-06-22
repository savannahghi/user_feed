import 'package:flutter/material.dart';

import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/domain/value_objects/feed_store.dart';
import 'package:shared_themes/colors.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/buttons.dart';

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
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: coverCallToActionColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  hasCover
                      ? viewCoverCallToActionTitle
                      : coverCallToActionTitle,
                  style: TextThemes.boldSize20Text(Colors.white),
                ),
                smallVerticalSizedBox,
                Text(
                  hasCover ? viewCoverCallToActionBody : coverCallToActionBody,
                  style: TextThemes.normalSize15Text(Colors.white)
                      .copyWith(height: 1.4),
                ),
              ],
            ),
          ),
          mediumVerticalSizedBox,
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
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
                mediumHorizontalSizedBox,
                SILPrimaryButton(
                  onPressed: () {
                    final Function? call = coverCallbacks![kBuyInsurance];
                    call!();
                  },
                  text: buyInsurance,
                  buttonColor: white.withOpacity(0.3),
                  textColor: white,
                  customPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  customElevation: 0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
