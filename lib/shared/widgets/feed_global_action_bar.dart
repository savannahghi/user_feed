import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_misc/sil_misc.dart';
import 'package:sil_themes/spaces.dart';

/// A global action component bar
///
/// Usage
///
/// - Just pass in a list of Actions and it will render the sliding
/// global action bar
///
/// Inputs
///
/// - a [List<Map<String, dynamic>> list] list of global actions in JSON format
class FeedGlobalActionBar extends StatelessWidget {
  FeedGlobalActionBar({
    Key? key,
    required this.globalActionsData,
    required this.flavour,
    required this.isAnonymous,
    this.isAnonymousFunc,
  })  : assert(() {
          if (isAnonymous && isAnonymousFunc == null) {
            throw Exception(
                'when `isAnonymous` is true, `isAnonymousFunc` should not be null');
          }

          return true;
        }()),
        super(key: key);

  final List<dynamic> globalActionsData;

  // the flavor in which the app is running
  final String flavour;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function? isAnonymousFunc;

  Widget _buildGlobalAction({required dynamic action,required BuildContext context}) {
    /// extract the action items here
    final String actionNameWithUnderscores = action['name'] as String;
    final String actionName = removeUnderscores(action['name'] as String);
    final String firstActionName =
        titleCase(toBeginningOfSentenceCase(actionName.split(' ').first)!);

    final String secondActionName =
        titleCase(toBeginningOfSentenceCase(actionName.split(' ').last)!);

    final String actionIconUrl = flavour == professionalFlavor
        ? 'no link url'
        : action['icon']['url'] as String;

    /// whether an anonymous user is allowed to perform this action
    final bool allowAnonymous = action['allowAnonymous'] as bool;

    return GestureDetector(
      onTap: () async {
        checkOnAllowAnonymousBeforeCall(
          allowFunc: () {
            callFeedAction(
                fullActionName: actionNameWithUnderscores,
                context: context,
                flavour: flavour);
          },
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: this.isAnonymousFunc!,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // icon
            Container(
              key: Key(action['id'] as String),
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
                child: (flavour == professionalFlavor)
                    ? const SizedBox()
                    : SvgPicture.network(
                        actionIconUrl,
                        height: 40,
                        width: 40,
                      ),
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
          for (dynamic action in globalActionsData[0])
            _buildGlobalAction(action: action, context: context),
        ],
      ),
    );
  }
}
