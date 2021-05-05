import 'package:flutter/material.dart';
import 'package:sil_feed/src/domain/entities/action.dart' as feed_action;
import 'package:sil_feed/src/domain/entities/nudge.dart';
import 'package:sil_feed/src/domain/value_objects/colors.dart';

import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';

import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';

/// [FeedNudge] takes in a [Map<String, dynamic> nudge] nudge, in form of a JSON,
/// and returns a nudge card with all the actions provided
class FeedNudge extends StatelessWidget {
  const FeedNudge({required this.nudge});

  final Nudge nudge;

  @override
  Widget build(BuildContext context) {
    /// extract the necessary nudge items
    final String title = nudge.title!;
    final String text = nudge.text!;

    final List<feed_action.Action> nudgeActions = nudge.actions!;

    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: nudgeBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextThemes.boldSize18Text()),
                smallVerticalSizedBox,
                Text(text, style: TextThemes.normalSize14Text()),
                smallVerticalSizedBox,

                // todo(future) - check if nudge actions are null
                Row(
                  children: <Widget>[
                    ...nudgeActions
                        .map(
                          (feed_action.Action nudgeAction) => FeedActionButton(
                            key: nudgeAction.id,
                            action: nudgeAction,
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
