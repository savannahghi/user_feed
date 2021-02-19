import 'dart:math';

import 'package:flutter/material.dart';

/// Refer to https://gitlab.slade360emr.com/optimalhealth/healthcloud/-/merge_requests/355/diffs
/// if you want to introduce medium screen in future

/// Widget that draws depending on screen size as specified by the breakpoints.
class ResponsiveWidget extends StatelessWidget {
  /// Refer to https://developer.android.com/training/multiscreen/screensizes#TaskUseSWQuali
  static const int smallScreenBreakPoint = 900;
  static const int smallScreenHeight = 600;

  /// Creates a ResponsiveWidget.
  ///
  /// The argument [largeScreen] must not be null.
  /// If medium screen is null then large screen will be drawn in place.
  /// if small screen is null then large screen will be drawn in place.
  const ResponsiveWidget(
      {this.largeScreen, this.mediumScreen, this.smallScreen});

  /// Widget to be drawn on a large screen.
  final Widget largeScreen;

  /// Widget to be drawn on a medium screen.
  final Widget mediumScreen;

  /// Widget to be drawn on a small screen.
  final Widget smallScreen;

  @override
  Widget build(BuildContext context) {
    //Returns the widget which is more appropriate for the screen size
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= smallScreenBreakPoint) {
          return largeScreen;
        } else {
          //if small screen implementation not available, then return large screen
          return smallScreen ?? largeScreen;
        }
      },
    );
  }

  /// Point to note (Using an iPad 9.7" as a test case)
  ///
  /// PROBLEM:
  /// Each time the orientation changes, the values of the width and height are recalculated
  /// automatically ([MediaQuery.of(context).size.width] & [MediaQuery.of(context).size.height]).
  /// So for devices like an IOS 9.7" iPad, the width of the tablet in portrait is `900`.
  /// Since the [smallScreenBreakPoint] is `940`, this makes the value of [isSmallScreen(context)]
  /// to be `TRUE`, which should not the case.
  ///
  /// SOLUTION:
  /// To solve this, we use the [max(a, b)] function from dart to get the size of longest side of the
  /// device. This is then used to calculate the various values [isSmallScreen], [isMediumScreen]
  /// and [isLargeScreen] regardless of the changes in orientation.
  ///
  /// Also, the reason for the change from the initial `1280` to `1200` is that on the same
  /// iPad(9.7"), the value of the longest side evaluates to `1224`. This makes the value of
  /// [isLargeScreen] to be `FALSE` even though the tablet is large enough show a large screen UI.
  /// Hence the change
  ///

  /// Large screen is any screen whose width is more than [largeScreenBreakPoint] pixels
  static bool isLargeScreen(BuildContext context) {
    double maxScreenSide = max(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return maxScreenSide >= smallScreenBreakPoint;
  }

  /// Small screen is any screen whose width is less than [smallScreenBreakPoint] pixels
  static bool isSmallScreen(BuildContext context) {
    double maxScreenSide = max(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return maxScreenSide < smallScreenBreakPoint;
  }
}
