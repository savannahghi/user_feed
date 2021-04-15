import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/entities/action.dart' as feed_action;

import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';

/// A global action component bar
///
/// Usage
///
/// - Just pass in a list of Actions and it will render the sliding
/// global action bar
///
/// Inputs
///

class FeedGlobalActionBar extends StatelessWidget {
  const FeedGlobalActionBar({
    Key? key,
    required this.globalActionsData,
    required this.flavour,
  }) : super(key: key);

  final List<feed_action.Action> globalActionsData;

  // the flavor in which the app is running
  final Flavour flavour;

  Widget _buildGlobalAction(
      {required feed_action.Action action, required BuildContext context}) {
    /// extract the action items here
    final String actionNameWithUnderscores = action.name!;
    final String actionName = removeUnderscores(action.name!);
    final String firstActionName =
        titleCase(toBeginningOfSentenceCase(actionName.split(' ').first)!);

    final String secondActionName =
        titleCase(toBeginningOfSentenceCase(actionName.split(' ').last)!);

    final String? actionIconUrl =
        flavour == Flavour.PRO ? 'no link url' : action.icon?.url;

    return GestureDetector(
      onTap: () {
        callFeedAction(
            fullActionName: actionNameWithUnderscores,
            context: context,
            flavour: flavour);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // icon
            Container(
              key: Key(action.id!),
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                  gradient: getFeedGlobalActionGradient(context),
                  shape: BoxShape.circle),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),

                // todo(abiud) - replace this url dynamically
                child: (flavour == Flavour.PRO)
                    ? const SizedBox()
                    : actionIconUrl != null
                        ? SvgPicture.network(
                            actionIconUrl,
                            height: 40,
                            width: 40,
                          )
                        : const SizedBox(),
              ),
            ),

            smallVerticalSizedBox,

            // text
            Row(
              children: <Widget>[
                Text(
                  firstActionName,
                  style: TextThemes.veryBoldSize14Text(Colors.black),
                ),
                const Text(' '),
                Text(
                  secondActionName,
                  style: TextThemes.veryBoldSize14Text(Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          smallHorizontalSizedBox,

          // todo(abiud) - add checks for when the actions are empty or null
          for (feed_action.Action action in globalActionsData)
            _buildGlobalAction(action: action, context: context),
        ],
      ),
    );
  }
}
