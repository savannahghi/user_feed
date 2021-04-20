import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';
import 'package:sil_feed/src/presentation/video_player/video_player.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_body.dart';
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
          links: mockMultipleFeedLinks,
          text: 'Feed item body',
          itemTextType: TextType.PLAIN,
        ),
      );

      await tester.pump(VisibilityDetectorController.instance.updateInterval);

      // await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(VideoPlayer), findsOneWidget);
      expect(find.byType(Stack), findsWidgets);
      expect(find.byType(Positioned), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
      expect(find.text('Feed item body'), findsOneWidget);
      expect(find.text('+ 5 more photos'), findsOneWidget);
      expect(find.text('Documents (5)'), findsOneWidget);
      expect(find.byKey(remainingPhotosKey), findsOneWidget);
    });

    testWidgets('should navigate to images page', (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        child: FeedItemBody(
          links: mockMultipleFeedLinks,
          text: 'Feed item body',
          itemTextType: TextType.PLAIN,
        ),
      );

      await tester.pump(const Duration(seconds: 30));

      // await tester.pump(VisibilityDetectorController.instance.updateInterval);

      await tester.tap(find.byKey(navigateToPhotos).first);
      await tester.pump(const Duration(seconds: 30));
    });

    testWidgets('should navigate to documents page',
        (WidgetTester tester) async {
      await buildTestWidget(
        tester: tester,
        child: FeedItemBody(
          links: mockMultipleFeedLinks,
          text: 'Feed item body',
          itemTextType: TextType.PLAIN,
        ),
      );

      await tester.pump(const Duration(seconds: 30));

      // await tester.pump(VisibilityDetectorController.instance.updateInterval);

      await tester.tap(find.byKey(navigateToDocuments).first);
      await tester.pump(const Duration(seconds: 30));
    });
  });
}
