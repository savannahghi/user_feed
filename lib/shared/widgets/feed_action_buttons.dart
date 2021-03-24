import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_misc/sil_misc.dart';

enum ActionType { primary, secondary, tertiary, global }

// return extension names as strings
extension FeedActionTypeEx on ActionType {
  String get name {
    return describeEnum(this).toUpperCase();
  }
}

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
      fillColor: buttonColor ?? Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(customRadius ?? 25.0),
        side: BorderSide(
            color: borderColor ?? Theme.of(context).accentColor,
            width: borderColor != null ? 1 : 0),
      ),
      child: customChild,
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
      child: customChild ??Text(
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
  FeedActionButton({
    Key? key,
    required this.action,
    required this.isAnonymous,
    required this.flavour,
    this.customFunction,
    this.isAnonymousFunc,
  })  : assert(() {
          if (isAnonymous && isAnonymousFunc == null) {
            throw Exception(
                'when `isAnonymous` is true, `isAnonymousFunc` should not be null');
          }

          return true;
        }()),
        super(key: key);

  /// the name of the action
  final Map<String, dynamic> action;

  /// [isAnonymous] indicated whether the logged in user is iAnonymous
  final bool isAnonymous;

  /// [isAnonymousFunc] function that will be called if the current logged in user is anonymous
  /// It is not required since it's only valid for `consumer app` only
  final Function? isAnonymousFunc;

  // the flavor in which the app is running
  final String flavour;

  /// Any custom function you wish to run instead of the default [callFeedAction]
  final Function? customFunction;

  /// the event that will be fired once the button is tapped
  // todo(abiud): add event here

  @override
  Widget build(BuildContext context) {
    // extract the handling into a variable from the JSON

    // extract the action name from the JSON
    final String actionNameWithUnderscore = action['name'] as String;
    final String actionName = removeUnderscores(action['name'] as String);
    final String actionType = action['actionType'] as String;

    /// whether an anonymous user is allowed to perform this action
    final bool allowAnonymous = action['allowAnonymous'] as bool;

    if (actionType == ActionType.primary.name) {
      return FeedPrimaryButton(
        onPressed: () {
          checkOnAllowAnonymousBeforeCall(
              allowFunc: () {
                if (customFunction != null) {
                  /// call any custom functions if available
                  customFunction!();
                } else {
                  callFeedAction(
                      fullActionName: actionNameWithUnderscore,
                      context: context,
                      flavour: flavour);
                }
              },
              isAnonymous: isAnonymous,
              allowAnonymous: allowAnonymous,
              isAnonymousFunc: this.isAnonymousFunc!);
          // dispatch event
        },
        text: actionName,
        buttonColor: Theme.of(context).accentColor,
        customPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        customElevation: 0,
      );
    }

    if (actionType == ActionType.secondary.name) {
      return FeedSecondaryButton(
        onPressed: () {
          if (allowAnonymous == false) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar(
                content: 'Coming Soon!',
                durationSeconds: kShortSnackbarDuration,
                label: 'Coming Soon'));
            return;
          }

          /// called when action can not be done by an anonymous user
          if (this.isAnonymousFunc != null) {
            this.isAnonymousFunc!();
          } else {}

          // process these actions for a user that is not anonymous
          callFeedAction(
              fullActionName: actionNameWithUnderscore,
              context: context,
              flavour: flavour);
        },
        text: actionName,
        customPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        
      );
    }

    // todo: handle tertiary and global later
    return FeedPrimaryButton(
      onPressed: () {
        callFeedAction(
            fullActionName: actionNameWithUnderscore,
            context: context,
            flavour: flavour);
      },
      text: 'Default Action',
    );
  }
}
