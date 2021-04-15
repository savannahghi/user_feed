import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/widgets/nudge_carousel.dart';

import 'package:sil_ui_components/sil_small_appbar.dart';

import 'mock_data.dart';

class MockRoutes {
  static const String route1 = '/route1';
  static const String nudgeCarousel = '/route2';
}

// these mocks are used to test the back button of SIL small appbar
class MockRouteGenerator {
  /// gets the current route based on the [RouteSettings]
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, Function> getFeedActionCallbacks() {
      return <String, Function>{
        kCompleteIndividualRiderKYC: () {},
      };
    }

    switch (settings.name) {

      // the root route config

      case MockRoutes.route1:
        return MaterialPageRoute<MaterialApp>(
          builder: (_) => const MaterialApp(
            home: Scaffold(
              appBar: SILSmallAppBar(title: MockRoutes.route1),
            ),
          ),
        );

      case MockRoutes.nudgeCarousel:
        return MaterialPageRoute<Widget>(
            builder: (_) => NudgeCarousel(
                  key: nudgeCarouselKey,
                  flavour: Flavour.CONSUMER,
                  isSmallScreen: false,
                  nudgeCarouselCallbacks: getFeedActionCallbacks(),
                  nudges: mockFeedNudges,
                  single: false,
                  unroll: false,
                ));
    }

    return MaterialPageRoute<MaterialApp>(
      builder: (_) => const MaterialApp(
        home: Scaffold(
          appBar: SILSmallAppBar(title: 'Default route'),
        ),
      ),
    );
  }
}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockHttpClientIO extends Mock implements io.HttpClient {}

class MockHttpClientRequest extends Mock implements io.HttpClientRequest {}

class MockHttpClientResponse extends Mock implements io.HttpClientResponse {}

class MockHttpHeaders extends Mock implements io.HttpHeaders {}
