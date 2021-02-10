import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sil_feed/shared/typedefs/feed_typedefs.dart';
import 'package:sil_feed/shared/utils/sizing.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_feed/shared/widgets/constants.dart';
import 'package:sil_feed/shared/widgets/feed_action_buttons.dart';

class FeedItemActionBar extends StatelessWidget {
  FeedItemActionBar({
    @required this.actions,
    @required this.flavour,
    @required this.feedItemID,
    @required this.resolveFunction,
    @required this.pinFunction,
    @required this.hideFunction,
  });

  final List<dynamic> actions;
  final String feedItemID;
  final String flavour;
  final feedItemActionTypeDef resolveFunction;
  final feedItemActionTypeDef pinFunction;
  final feedItemActionTypeDef hideFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ...actions.map((dynamic action) {
            final String actionName = action['name'];
            final String actionNameWithoutUnderscores =
                FeedUtils.removeUnderscores(actionName);

            return FeedNoBorderButton(
              onPressed: () {
                // ignore: todo
                // TODO(abiud): check for anonymous here
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
              text: '',
              customChild: Center(
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      FeedUtils.getFeedItemActionIconUrl(actionName),
                      height: 20,
                      width: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    smallHorizontalSizedBox,
                    Text(
                      actionNameWithoutUnderscores.split('ITEM')?.first,
                      style: TextThemes.boldSize12Text(),
                    ),
                  ],
                ),
              ),
              // ignore: todo
              // TODO(abiud): pass this from the parent component
              // isAnonymous: false,
              // flavour: flavour,
            );
          }),
        ],
      ),
    );
  }
}
