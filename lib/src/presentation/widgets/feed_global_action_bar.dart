import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/entities/action.dart' as feed_action;
import 'package:sil_feed/src/domain/value_objects/feed_store.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';

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
  FeedGlobalActionBar({Key? key, required this.globalActionsData})
      : super(key: key);

  final List<feed_action.Action> globalActionsData;

  // the flavor in which the app is running
  // ignore: unused_field
  final Flavour _flavour = FeedStore().flavour.valueWrapper!.value;

  Widget _buildGlobalAction(
      {required List<feed_action.Action> actions,
      required BuildContext context,
      required String matcher}) {
    final feed_action.Action action =
        actions.singleWhere((feed_action.Action el) => el.name == matcher);

    /// extract the action items here
    final String actionNameWithUnderscores = action.name!;
    final String actionName = removeUnderscores(action.name!);

    final String secondActionName =
        titleCase(toBeginningOfSentenceCase(actionName.split(' ').last)!);

    final String? actionIconUrl = action.icon!.url;

    return GestureDetector(
      onTap: () {
        callFeedAction(
            fullActionName: actionNameWithUnderscores, context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // Feed Marketplace Icon
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
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: (actionIconUrl != null && actionIconUrl != UNKNOWN)
                    ? SvgPicture.network(actionIconUrl, height: 40, width: 40)
                    : const SizedBox(),
              ),
            ),

            smallVerticalSizedBox,

            // Feed Marketplace Title
            Text(
              secondActionName,
              style: TextThemes.boldSize12Text(Colors.black),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// arrange global actions in order of [Insurance] -> [Consulation] -> [Medication] -> [Tests]
          _buildGlobalAction(
              actions: globalActionsData,
              context: context,
              matcher: kGetInsurance),
          _buildGlobalAction(
              actions: globalActionsData,
              context: context,
              matcher: kGetConsultation),
          _buildGlobalAction(
              actions: globalActionsData,
              context: context,
              matcher: kGetMedicine),
          _buildGlobalAction(
              actions: globalActionsData, context: context, matcher: kGetTest),
        ],
      ),
    );
  }
}
