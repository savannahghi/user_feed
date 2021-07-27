import 'dart:async';
import 'package:flutter/material.dart';
import 'package:misc_utilities/responsive_widget.dart';
import 'package:user_feed/user_feed.dart';

/// A wrapper that handles fetching user's feed, toggles a shimmer animation to provide
/// user with visual feedback when feed is in a loading state
class FeedComponentWrapper extends StatefulWidget {
  @override
  _FeedComponentWrapperState createState() => _FeedComponentWrapperState();
}

class _FeedComponentWrapperState extends State<FeedComponentWrapper> {
  late Stream<dynamic> _feedStream;
  late StreamController<Object> _feedStreamController;

  @override
  void initState() {
    super.initState();
    _feedStreamController = StreamController<Object>.broadcast();
    _feedStream = _feedStreamController.stream;

    WidgetsBinding.instance?.addPostFrameCallback((Duration timeStamp) {
      /// Call your function to fetch user's feed
      // fetchUserFeed();
    });
  }

  @override
  void dispose() {
    _feedStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: _feedStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        /// Show feed shimmer before the data is displayed
        if (snapshot.data is Map<String, dynamic> &&
            snapshot.data['data'] != null &&
            snapshot.data['data']['loading'] != null &&
            snapshot.data['data']['loading'] == true) {
          return const FeedLoadingShimmer(
            feedItemShimmerPadding: 0,
            flavor: Flavour.PRO,
            globalActionShimmerHorizontalPadding: 0,
            nudgeShimmerPadding: 0,
          );
        }

        /// Error checking
        if (snapshot.hasError) {
          final Map<String, dynamic>? error =
              snapshot.error as Map<String, dynamic>?;

          /// check if the error is a timeout error and return an appropriate widget
          if (error!['error'] == 'timeout') {
            return Center(
                child: Container(
                    // Add your timeout error widget
                    ));
          }

          // other type of error but not a timeout
          return Container(
              // Add your timeout error widget
              );
        }
        if (snapshot.hasData) {
          final FeedResponsePayload payload = FeedResponsePayload.fromJson(
              snapshot.data as Map<String, dynamic>);

          return FeedComponent(
            userFeed: payload,
            flavour: Flavour.PRO,
            profileProgress: '100',
            setupComplete: true,
            isSmallScreen: ResponsiveWidget.isSmallScreen(context),
            feedContentCallbacks: getFeedActionCallbacks(context: context),
          );
        }

        return const FeedLoadingShimmer(
          feedItemShimmerPadding: 0,
          flavor: Flavour.PRO,
          globalActionShimmerHorizontalPadding: 0,
          nudgeShimmerPadding: 0,
        );
      },
    );
  }
}

Map<String, Function> getFeedActionCallbacks({required BuildContext context}) {
  return <String, Function>{
    kCompleteProfile: () {
      Navigator.of(context, rootNavigator: true)
          .pushNamed('/completeProfileRoute');
    },
  };
}
