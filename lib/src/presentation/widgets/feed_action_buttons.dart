// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:user_feed/src/application/helpers/utils.dart';
import 'package:user_feed/src/domain/entities/action.dart' as feed_action;
import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';

class FeedPrimaryButton extends StatelessWidget {
  const FeedPrimaryButton(
      {this.buttonKey,
      required this.onPressed,
      required this.text,
      this.buttonColor,
      this.borderColor,
      this.textColor,
      this.customChild,
      this.customRadius,
      this.customPadding,
      this.customElevation});

  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? customChild;
  final double? customRadius;
  final EdgeInsets? customPadding;
  final double? customElevation;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      key: buttonKey,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      elevation: customElevation ?? 0,
      onPressed: onPressed,
      padding: customPadding ?? const EdgeInsets.all(10),
      fillColor: buttonColor ?? accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(customRadius ?? 25.0),
        side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: borderColor != null ? 1 : 0),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextThemes.boldSize14Text(Colors.white),
      ),
    );
  }
}

class FeedSecondaryButton extends StatelessWidget {
  const FeedSecondaryButton(
      {this.buttonKey,
      required this.onPressed,
      required this.text,
      this.buttonColor,
      this.textColor,
      this.customChild,
      this.customRadius,
      this.customPadding,
      this.borderColor,
      this.addBorder = false,
      this.customElevation});

  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? customChild;
  final double? customRadius;
  final EdgeInsets? customPadding;
  final double? customElevation;
  final Color? borderColor;
  final bool? addBorder;
  final Key? buttonKey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: buttonKey,
      onPressed: onPressed,
      child: customChild ??
          Text(
            text,
            style: TextThemes.veryBoldSize15Text(
                textColor ?? Theme.of(context).primaryColor),
          ),
    );
  }
}

class FeedNoBorderButton extends StatelessWidget {
  const FeedNoBorderButton({
    this.buttonKey,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.customChild,
    this.customPadding,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Widget? customChild;
  final Key? buttonKey;
  final EdgeInsets? customPadding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: buttonKey,
      onPressed: onPressed,
      child: customChild ??
          Text(
            text,
            style: TextThemes.veryBoldSize15Text(
                textColor ?? Theme.of(context).primaryColor),
          ),
    );
  }
}

/// [FeedActionButton] is a component which when passed in one action,
/// returns a button with the contents in the actions
class FeedActionButton extends StatelessWidget {
  const FeedActionButton({super.key, required this.action});

  /// the name of the action
  final feed_action.Action action;

  @override
  Widget build(BuildContext context) {
    // extract the handling into a variable from the JSON

    // extract the action name from the JSON
    final String actionNameWithUnderscore =
        action.name!; // COMPLETE_YOUR_INDIVIDUAL_RIDER_KYC
    final String actionName =
        removeUnderscores(action.name!); // Complete Your Individual KYC
    final ActionType? actionType = action.actionType;

    if (actionType == ActionType.PRIMARY) {
      return FeedPrimaryButton(
        onPressed: () {
          callFeedAction(
              fullActionName: actionNameWithUnderscore, context: context);
        },
        text: actionName,
        buttonColor: primaryColor.withOpacity(0.9),
        customPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        customElevation: 0,
      );
    }

    if (actionType == ActionType.SECONDARY) {
      return FeedSecondaryButton(
        onPressed: () {
          callFeedAction(
              fullActionName: actionNameWithUnderscore, context: context);
        },
        text: actionName,
        customPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      );
    }

    return FeedPrimaryButton(
      onPressed: () {
        callFeedAction(
            fullActionName: actionNameWithUnderscore, context: context);
      },
      text: actionName,
    );
  }
}
