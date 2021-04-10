import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/presentation/widgets/nudge_carousel.dart';

/// returns a human readable format of the date string
/// passed to it
///
/// INPUT - a date string such as `2020-11-19T10:15:21Z`
///
/// OUTPUT - a human readable format such as `Yesterday at 10:12pm`
String getHumanReadableTimestamp(String date) {
  /// parse the string first before processing
  final DateTime parsedDate = DateTime.parse(date);

  /// convert this date to a local format i.e change the timezone
  /// to the one in the device
  final DateTime localDateTime = parsedDate.toLocal();

  final DateTime now = DateTime.now();
  final DateTime justNow = DateTime.now().subtract(const Duration(minutes: 1));

  // return 'Just Now' if the difference is less than 1 minute
  if (!localDateTime.difference(justNow).isNegative) {
    return 'Just now';
  }

  // return '20 minutes ago' if
  // the difference is greater than 1 minute
  final String roughTimeString = DateFormat('jm').format(localDateTime);
  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return roughTimeString;
  }

  // return 'yesterday' if the difference is less than 1 day
  final DateTime yesterday = now.subtract(const Duration(days: 1));

  if (localDateTime.day == yesterday.day &&
      localDateTime.month == yesterday.month &&
      localDateTime.year == yesterday.year) {
    return 'Yesterday, $roughTimeString';
  }

  // return the week day if the difference is more than 1 day
  // and less than 4 days
  if (now.difference(localDateTime).inDays < 4) {
    final String weekday = DateFormat('EEEE').format(localDateTime);
    return '$weekday, $roughTimeString';
  }

  // return the actual date and time if it is more than 4 days
  return DateFormat('MMMd, yyyy').format(parsedDate);
}

/// checks whether an anonymous user is allowed to perform an action when they are anonymous
void checkOnAllowAnonymousBeforeCall(
    {required Function allowFunc,
    required bool isAnonymous,
    required bool allowAnonymous,
    required Function isAnonymousFunc}) {
  // check whether the user is anonymous and that this action can be triggered by an anonymous user
  if (isAnonymous && allowAnonymous) {
    allowFunc();
    return;
  }

  // check whether the user is anonymous and this action cannot be triggered by an anonymous user
  if (isAnonymous && !allowAnonymous) {
    /// called when action can not be done by an anonymous user
    isAnonymousFunc();
    return;
  }

  // default to calling [allowFunc]
  allowFunc();
  return;
}

/// looks through the list of allowed actions [allConsumerActions and AllProActions]
/// and executes the respective function
void callFeedAction(
    {required String fullActionName,
    required BuildContext context,
    required Flavour flavour}) {
  // get the callbacks
  final Map<String, dynamic> callbacks = (context
          .findAncestorWidgetOfExactType<FeedComponent>()
          ?.feedContentCallbacks ??
      context
          .findAncestorWidgetOfExactType<NudgeCarousel>()
          ?.nudgeCarouselCallbacks)!;

  if (flavour == Flavour.CONSUMER) {
    // loop through the consumer actions and call their functions
    allConsumerActions.map(
      (String consumerAction) {
        /// check if the passed in actionName is the same as the one we are
        /// looping through at this point
        ///
        /// if it checks out we start processing the action
        if (fullActionName == consumerAction) {
          /// looks through the callbacks you provided and searches for the
          /// callback that has the key with the name [fullActionName]
          if (callbacks.containsKey(fullActionName)) {
            /// if it find it, it executes the callback
            callbacks[fullActionName]();
            return;
          } else {
            /// if it does not, it shows a ['Coming Soon'] snackbar
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                snackbar(
                    content: 'Coming Soon!',
                    durationSeconds: kShortSnackbarDuration,
                    label: 'Coming Soon'),
              );
          }
        }
      },
    ).toList();
  } else if (flavour == Flavour.PRO) {
    // loop through the pro actions and call their functions
    allProActions.map(
      (String proAction) {
        /// check if the passed in actionName is the same as the one we are
        /// looping through at this point
        ///
        /// if it checks out we start processing the action
        if (fullActionName == proAction) {
          /// looks through the callbacks you provided and searches for the
          /// callback that has the key with the name [fullActionName]
          if (callbacks.containsKey(fullActionName)) {
            /// if it find it, it executes the callback
            callbacks[fullActionName]();
            return;
          } else {
            /// if it does not, it shows a ['Coming Soon'] snackbar
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar(
                  content: 'Coming Soon!',
                  label: 'Coming Soon',
                  durationSeconds: kShortSnackbarDuration));
          }
        } else {
          /// if it does not, it shows a ['Coming Soon'] snackbar
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackbar(
                content: 'Coming Soon!',
                label: 'Coming Soon',
                durationSeconds: kShortSnackbarDuration));
        }
      },
    ).toList();
  }
}

/// returns an icon based on the [actionName]
///
/// this method returns links to **SVG pictures only**
String getFeedItemActionIconUrl(String actionName) {
  if (actionName == kResolveItem) {
    return resolveIconUrl;
  }
  if (actionName == kHideItem) {
    return hideIconUrl;
  }
  if (actionName == kPinItem) {
    return pinIconUrl;
  }
  return resolveIconUrl;
}

/// processes media from the feed [links]
List<Link> processFeedMedia(
    {required List<Link> links, required LinkType linkType}) {
  switch (linkType) {
    case LinkType.PNG_IMAGE:
      return links
          .where((Link link) => link.linkType == LinkType.PNG_IMAGE)
          .toList();
    case LinkType.PDF_DOCUMENT:
      return links
          .where((Link link) => link.linkType == LinkType.PDF_DOCUMENT)
          .toList();
    case LinkType.YOUTUBE_VIDEO:
      return links
          .where((Link link) => link.linkType == LinkType.YOUTUBE_VIDEO)
          .toList();
    default:
      return links;
  }
}

int conversationsLengthBuilder(int conversations) {
  if (conversations <= 1) {
    return 1;
  }
  return 2;
}

LinearGradient getFeedGlobalActionGradient(BuildContext context) =>
    LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Theme.of(context).accentColor,
        Theme.of(context).primaryColor.withOpacity(0.5),
      ],
      stops: const <double>[0.4, 1],
    );

String displayProgress(String? progress) {
  return 'Your profile is $progress% complete, complete it now';
}

SnackBar snackbar(

    /// [content] must be either of type [Widget] or [String]
    {required dynamic content,
    int durationSeconds = 10,
    String? label,
    Function? callback}) {
  return SnackBar(
    content: content.runtimeType == String
        ? Text(content as String)
        : content as Widget,
    duration: Duration(seconds: durationSeconds),
    action: callback != null
        ? SnackBarAction(label: label!, onPressed: callback as void Function())
        : null,
  );
}

/// [removeUnderscores] removes underscores from a sentence
String removeUnderscores(String sentence) {
  return titleCase(sentence.toString().replaceAll('_', ' ').toLowerCase());
}

/// [titleCase] returns a title cased sentence
String titleCase(String sentence) {
  return sentence
      .toLowerCase()
      .split(' ')
      .map((String e) => e.trim())
      .map((String word) => toBeginningOfSentenceCase(word))
      .join(' ');
}
