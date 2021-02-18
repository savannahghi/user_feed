import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_feed/shared/widgets/constants.dart';
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
  final List<dynamic> globalActions;

  // the flavor in which the app is running
  final String flavour;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  FeedGlobalActionBar({
    Key key,
    @required this.globalActions,
    @required this.flavour,
    @required this.isAnonymous,
    this.isAnonymousFunc,
  })  : assert(() {
          if (isAnonymous != null) {
            if (isAnonymous && isAnonymousFunc == null) {
              throw Exception(
                  'when `isAnonymous` is true, `isAnonymousFunc` should not be null');
            }
          }
          return true;
        }()),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          smallHorizontalSizedBox,

          // todo(abiud) - add checks for when the actions are empty or null
          ...globalActions.map(
            (dynamic action) {
              /// extract the action items here
              final String actionNameWithUnderscores = action['name'];
              final String actionName =
                  FeedUtils.removeUnderscores(action['name']);
              final String firstActionName = FeedUtils.titleCase(
                  toBeginningOfSentenceCase(actionName.split(' ').first));
              final String secondActionName = FeedUtils.titleCase(
                  toBeginningOfSentenceCase(actionName.split(' ').last));
              final String actionIconUrl = (flavour == professionalString)
                  ? 'no link url'
                  : action['icon']['url'];

              /// whether an anonymous user is allowed to perform this action
              final bool allowAnonymous = action['allowAnonymous'] as bool;

              return Container(
                child: GestureDetector(
                  onTap: () async {
                    FeedUtils.checkOnAllowAnonymousBeforeCall(
                      allowFunc: () {
                        FeedUtils.callFeedAction(
                            fullActionName: actionNameWithUnderscores,
                            context: context,
                            flavour: flavour);
                      },
                      isAnonymous: isAnonymous,
                      allowAnonymous: allowAnonymous,
                      isAnonymousFunc: this.isAnonymousFunc,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        // icon
                        Container(
                          key: Key(action['id']),
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
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
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),

                            // todo(abiud) - replace this url dynamically
                            child: (flavour == professionalString)
                                ? SizedBox()
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
                              style:
                                  TextThemes.veryBoldSize14Text(Colors.black),
                            ),
                            Text(' '),
                            Text(
                              secondActionName,
                              style:
                                  TextThemes.veryBoldSize14Text(Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
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
