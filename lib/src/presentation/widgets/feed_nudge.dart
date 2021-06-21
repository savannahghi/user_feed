import 'package:flutter/material.dart';
import 'package:user_feed/src/domain/entities/action.dart' as feed_action;
import 'package:user_feed/src/domain/entities/nudge.dart';
import 'package:user_feed/src/presentation/widgets/feed_action_buttons.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

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

    const BorderRadius radius = BorderRadius.all(Radius.circular(8));

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: radius,
              gradient: LinearGradient(
                colors: <Color>[
                  Theme.of(context).accentColor.withRed(130).withOpacity(0.8),
                  Theme.of(context).accentColor.withBlue(100),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: const BoxDecoration(
            borderRadius: radius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextThemes.boldSize18Text(Colors.white),
              ),
              smallVerticalSizedBox,
              Text(
                text,
                style: TextThemes.normalSize15Text(Colors.white),
              ),
              smallVerticalSizedBox,

              // todo(future) - check if nudge actions are null
              Row(
                children: <Widget>[
                  ...nudgeActions
                      .map(
                        (feed_action.Action nudgeAction) => FeedActionButton(
                          key: Key(nudgeAction.id!),
                          action: nudgeAction,
                        ),
                      )
                      .toList()
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
