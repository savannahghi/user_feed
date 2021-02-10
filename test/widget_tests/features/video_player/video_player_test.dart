import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/features/video_player/video_player.dart';
import 'package:sil_feed/shared/router_generator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('VideoPlayer', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render videos correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await provideMockedNetworkImages(() async {
          await tester.pumpWidget(MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorObservers: <NavigatorObserver>[mockObserver],
            home: Scaffold(
              body: Container(
                child: VideoPlayer(
                  videos: <dynamic>[
                    <String, dynamic>{
                      'id': '1ns2o8pktkMsAEmP9dIKFvIhvAC',
                      'url': 'https://youtu.be/gcv2Z2AdpjM',
                      'linkType': 'YOUTUBE_VIDEO',
                      'thumbnail':
                          'https://assets.healthcloud.co.ke/items/videos/thumbs/01_lead.png',
                      'title': 'Be.Well lead'
                    }
                  ],
                ),
              ),
            ),
          ));

          // verify UI renders correctly
          expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
        });
      });
    });
  });
}
