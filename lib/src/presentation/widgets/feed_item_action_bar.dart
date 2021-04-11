import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/feed_type_defs.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';
import 'package:sil_feed/src/domain/entities/action.dart' as feed_action;

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

  final List<feed_action.Action> actions;
  final String feedItemID;
  final Flavour flavour;

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
            (feed_action.Action action) {
              final String actionName = action.name!;
              final String actionNameWithoutUnderscores =
                  removeUnderscores(actionName).split('Item').first;

              /// whether an anonymous user is allowed to perform this action
              final bool allowAnonymous = action.allowAnonymous!;

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
                        package: packageName,
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
