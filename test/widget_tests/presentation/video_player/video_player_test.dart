import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../mock_data.dart';
import '../../../test_helpers.dart';

void main() {
  group('VideoPlayer', () {
    testWidgets('should render videos correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildTestWidget(
            tester: tester,
            child: VideoPlayer(videos: <Link>[mockYoutubeVideoLink]));

        // verify UI renders correctly
        expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
        expect(find.byType(IconButton), findsOneWidget);
        await tester.tap(find.byType(IconButton));
        await tester.pump();
      });
    });

    testWidgets(
        'should return an empty SizedBox if the videos are empty or null',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildTestWidget(
            tester: tester, child: const VideoPlayer(videos: <Link>[]));

        // verify UI renders correctly
        expect(find.byType(YoutubePlayerBuilder), findsNothing);
        expect(find.byType(SizedBox), findsOneWidget);
      });
    });

    testWidgets('should play a video', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImagesFor(
          () async => buildTestWidget(
            tester: tester,
            child: VideoPlayer(
              videos: <Link>[mockYoutubeVideoLink],
            ),
          ),
        );

        // verify UI renders correctly
        expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
        expect(find.byKey(videoPlayPauseKey), findsOneWidget);

        await tester.tap(find.byKey(videoPlayPauseKey));
        await tester.pumpAndSettle();
      });
    }, skip: true); // the video player tests need to be improved
  });
}
