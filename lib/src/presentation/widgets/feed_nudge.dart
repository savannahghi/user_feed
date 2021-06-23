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

    return Stack(
      children: <Widget>[
        Positioned(
          right: 30,
          top: 30,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context)
                    .accentColor
                    .withOpacity(nudge.links!.isEmpty ? 0.2 : 0)),
            child: nudge.links!.isNotEmpty
                ? Image.network(nudge.links![0].url!)
                : null,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, style: TextThemes.boldSize18Text()),
              smallVerticalSizedBox,
              Text(text, style: TextThemes.normalSize15Text()),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
