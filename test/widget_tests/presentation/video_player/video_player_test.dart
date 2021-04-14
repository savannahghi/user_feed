import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/presentation/router/router_generator.dart';
import 'package:sil_feed/src/presentation/video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../mock_data.dart';
import '../../../mocks.dart';

void main() {
  group('VideoPlayer', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render videos correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(
          MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorObservers: <NavigatorObserver>[mockObserver],
            home: Scaffold(
              body: VideoPlayer(videos: <Link>[mockYoutubeVideoLink]),
            ),
          ),
        );
        await tester.pump();
        // verify UI renders correctly
        expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
        expect(find.byType(IconButton), findsOneWidget);
        await tester.tap(find.byType(IconButton));
        await tester.pump();
      });
    });
  });
}
