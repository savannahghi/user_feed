import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../mock_data.dart';
import '../../../test_helpers.dart';

class _MyHttpOverrides extends HttpOverrides {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    HttpOverrides.global = _MyHttpOverrides();
  });
  group('VideoPlayer', () {
    testWidgets('should render videos correctly', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildTestWidget(
            tester: tester,
            child: VideoPlayer(videos: <Link>[mockYoutubeVideoLink]));

        // verify UI renders correctly
        expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
        expect(find.byType(CurrentPosition), findsOneWidget);
        expect(find.byType(ProgressBar), findsOneWidget);
        expect(find.byType(RemainingDuration), findsOneWidget);
        expect(find.byType(PlaybackSpeedButton), findsOneWidget);
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

    testWidgets('should test player controllers', (WidgetTester tester) async {
      final YoutubePlayerController _videoController = YoutubePlayerController(
        initialVideoId: 'mKnlXcS3_Z0',
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );

      await mockNetworkImages(() async {
        await buildTestWidget(
          tester: tester,
          child: VideoControllers(
            videoIds: const <String>[
              'mKnlXcS3_Z1',
              'mKnlXcS3_Z2',
              'mKnlXcS3_Z3'
            ],
            isPlayerReady: true,
            videoController: _videoController,
          ),
        );
      });
      // await tester.pumpAndSettle();
      // verify UI renders correctly
      expect(find.byType(VideoControllers), findsOneWidget);
      await tester.pump(const Duration());
      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(IconButton), findsWidgets);

      expect(_videoController.initialVideoId, 'mKnlXcS3_Z0');

      await tester.tap(find.byKey(videoNextKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(videoPreviousKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(videoVolumeKey));
      await tester.pumpAndSettle();
      // unmute
      await tester.tap(find.byKey(videoVolumeKey));

      // pause video
      await tester.tap(find.byKey(videoPlayPauseKey));
      await tester.pumpAndSettle();
      expect(_videoController.value.isPlaying, false);
      _videoController.updateValue(YoutubePlayerValue(isPlaying: true));
      // play video
      await tester.tap(find.byKey(videoPlayPauseKey));
      expect(_videoController.value.isPlaying, true);
    });

    testWidgets('should call state callbacks', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          child: Builder(
            builder: (BuildContext context) {
              return VideoPlayer(videos: <Link>[mockYoutubeVideoLink]);
            },
          ),
        );

        expect(find.byType(YoutubePlayerBuilder), findsOneWidget);
        expect(find.byType(YoutubePlayer), findsOneWidget);

        final State<StatefulWidget> state = tester.allStates.singleWhere(
            (State<StatefulWidget> el) => el.toString() == 'VideoPlayerState');
        expect(state, isNotNull);

        final VideoPlayerState _state = state as VideoPlayerState;

        expect(_state, isNotNull);

        expect(_state.isPlayerReady, false);

        _state.onReadyCallback();

        expect(_state.isPlayerReady, true);

        expect(_state.mounted, true);

        expect(_state.videoController.value.isFullScreen, false);

        expect(() => _state.listener(), returnsNormally);

        const YoutubeMetaData videoMeta = YoutubeMetaData(
            videoId: 'https://www.youtube.com/watch?v=gcv2Z2AdpjM');

        expect(videoMeta, isNotNull);

        expect(() => _state.onEndedCallback(videoMeta), returnsNormally);
      });
    });
  });
}
