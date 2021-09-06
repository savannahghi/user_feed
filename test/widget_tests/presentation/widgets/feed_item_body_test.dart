import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/application/helpers/utils.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/image_viewer/image_grid.dart';
import 'package:user_feed/src/presentation/video_player/video_player.dart';
import 'package:user_feed/src/presentation/widgets/feed_item_body.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../mock_data.dart';
import '../../../test_helpers.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('FeedItemBody : ', () {
    setUpAll(() {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;
    });

    testWidgets('should render correctly with all the content',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        child: FeedItemBody(
          summary,
          links: mockMultipleFeedLinks,
          text: feedItemBody,
          itemTextType: TextType.PLAIN,
          videos: processFeedMedia(
              links: mockMultipleFeedLinks, linkType: LinkType.YOUTUBE_VIDEO),
        ),
      );

      await tester.pump(VisibilityDetectorController.instance.updateInterval);

      expect(find.byType(VideoPlayer), findsOneWidget);
      expect(find.byType(Stack), findsWidgets);
      expect(find.byType(Positioned), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.text('+ 5 more photos'), findsOneWidget);
      expect(find.byKey(remainingPhotosKey), findsOneWidget);
    });

    testWidgets('should call state callbacks', (WidgetTester tester) async {
      late BuildContext _context;
      await tester.runAsync(() async {
        await buildTestWidget(
          tester: tester,
          child: Builder(
            builder: (BuildContext context) {
              _context = context;
              return FeedItemBody(
                '---------------- This is a summary',
                links: mockMultipleFeedLinks2,
                text: 'Feed item body',
                itemTextType: TextType.PLAIN,
                videos: processFeedMedia(
                    links: mockMultipleFeedLinks2,
                    linkType: LinkType.YOUTUBE_VIDEO),
              );
            },
          ),
        );

        expect(find.text('+ 5 more photos'), findsOneWidget);

        expect(_context, isNotNull);

        final State<StatefulWidget> state = tester.allStates.singleWhere(
            (State<StatefulWidget> el) => el.toString() == 'FeedItemBodyState');
        expect(state, isNotNull);

        final FeedItemBodyState _state = state as FeedItemBodyState;

        expect(_state, isNotNull);

        expect(() => _state.navigateToImagesGrid(), returnsNormally);
        expect(() => _state.feedItemImageGridNavBuilder(_context),
            returnsNormally);
        expect(_state.feedItemImageGridNavBuilder(_context),
            isA<FeedItemImageGrid>());
      });
    });
  });
}
