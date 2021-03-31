import 'package:flutter/material.dart';
import 'package:sil_feed/src/shared/utils/strings.dart';
import 'package:sil_feed/src/shared/utils/widget_keys.dart';
import 'package:sil_feed/src/shared/widgets/feed_action_buttons.dart';

import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';

/// [FeedNudge] takes in a [Map<String, dynamic> nudge] nudge, in form of a JSON,
/// and returns a nudge card with all the actions provided
class FeedNudge extends StatelessWidget {
  const FeedNudge(
      {required this.nudge,
      required this.isAnonymous,
      required this.isAnonymousFunc,
      required this.flavor});

  final String flavor;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function isAnonymousFunc;

  final Map<String, dynamic> nudge;

  @override
  Widget build(BuildContext context) {
    /// extract the necessary nudge items
    final String title = nudge['title'] as String;
    final String text = nudge['text'] as String;

    final List<dynamic> nudgeMedia = nudge['links'] as List<dynamic>;

    final List<dynamic> nudgeActions = nudge['actions'] as List<dynamic>;

    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(nudgeMedia.isNotEmpty
                      ? nudge['links'][0]['url'] as String
                      : fallBackBewellLogoUrl),
                  fit: BoxFit.contain),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextThemes.veryBoldSize18Text(Colors.white)),
                smallVerticalSizedBox,
                Text(text, style: TextThemes.normalSize16Text(Colors.white)),
                smallVerticalSizedBox,

                // todo(future) - check if nudge actions are null
                Row(
                  children: <Widget>[
                    ...nudgeActions
                        .map(
                          (dynamic nudgeAction) => FeedActionButton(
                            key: feedActionButtonKey,
                            action: nudgeAction as Map<String, dynamic>,
                            isAnonymous: this.isAnonymous,
                            isAnonymousFunc: this.isAnonymousFunc,
                            flavour: flavor,
                          ),
                        )
                        .toList()
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
