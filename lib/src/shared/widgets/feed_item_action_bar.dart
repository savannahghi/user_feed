import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sil_feed/src/constants/constants.dart';
import 'package:sil_feed/src/shared/type_defs/feed_type_defs.dart';
import 'package:sil_feed/src/shared/utils/utils.dart';
import 'package:sil_feed/src/shared/widgets/feed_action_buttons.dart';

import 'package:sil_misc/sil_misc.dart';
import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';

class FeedItemActionBar extends StatelessWidget {
  const FeedItemActionBar({
    required this.actions,
    required this.flavour,
    required this.feedItemID,
    required this.resolveFunction,
    required this.pinFunction,
    required this.hideFunction,
    required this.isAnonymous,
    required this.isAnonymousFunc,
  });

  final List<dynamic> actions;
  final String feedItemID;
  final String flavour;

  // a callback to resolve an item
  final feedItemActionTypeDef resolveFunction;

  // a callback to pin an item
  final feedItemActionTypeDef pinFunction;

  // a callback to hide an item
  final feedItemActionTypeDef hideFunction;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ...actions.map(
            (dynamic action) {
              final String actionName = action['name'] as String;
              final String actionNameWithoutUnderscores =
                  removeUnderscores(actionName).split('Item').first;

              /// whether an anonymous user is allowed to perform this action
              final bool allowAnonymous = action['allowAnonymous'] as bool;

              return FeedNoBorderButton(
                buttonKey: Key(actionName),
                onPressed: () {
                  checkOnAllowAnonymousBeforeCall(
                    allowFunc: () {
                      switch (actionName) {
                        case kResolveItem:
                          resolveFunction(flavour: flavour, itemID: feedItemID);
                          break;
                        case kPinItem:
                          pinFunction(flavour: flavour, itemID: feedItemID);
                          break;
                        case kHideItem:
                          hideFunction(flavour: flavour, itemID: feedItemID);
                      }
                    },
                    isAnonymous: isAnonymous,
                    allowAnonymous: allowAnonymous,
                    isAnonymousFunc: this.isAnonymousFunc,
                  );
                },
                text: '',
                customChild: Center(
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        getFeedItemActionIconUrl(actionName),
                        height: 20,
                        width: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      smallHorizontalSizedBox,
                      Text(
                        actionNameWithoutUnderscores.split('ITEM').first,
                        style: TextThemes.boldSize12Text(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
