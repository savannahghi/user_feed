import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/features/video_player/video_player.dart';
import 'package:sil_feed/shared/widgets/feed_item_body.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../mocks.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('should test feed item body widget', () {
    testWidgets('should test feed item comment card',
        (WidgetTester tester) async {
      VisibilityDetectorController.instance.updateInterval = Duration.zero;

      String flavour;
      await tester.pumpWidget(MaterialApp(
        home: FeedItemBody(
          links: mockFeedLinks,
          flavour: flavour,
          text: 'This is the feed item body',
        ),
      ));

      await tester.pump(VisibilityDetectorController.instance.updateInterval);

      // await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byType(VideoPlayer), findsOneWidget);
      expect(find.byType(Stack), findsWidgets);
      expect(find.byType(Positioned), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(GestureDetector), findsWidgets);
    });
  });
}
