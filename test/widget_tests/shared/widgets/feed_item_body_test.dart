import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/features/video_player/video_player.dart';
import 'package:sil_feed/shared/widgets/feed_item_body.dart';

import '../../../mocks.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('should test feed item body widget', () {
    testWidgets('should test feed item comment card',
        (WidgetTester tester) async {
      String flavour;
      await tester.pumpWidget(MaterialApp(
        home: FeedItemBody(
          links: mockFeedLinks,
          flavour: flavour,
          text: 'This is the feed item body',
        ),
      ));
      expect(find.byType(VideoPlayer), findsOneWidget);
      expect(find.byType(Stack), findsNWidgets(2));
      expect(find.byType(Positioned), findsNWidgets(3));
      expect(find.byType(Container), findsNWidgets(11));
      expect(find.byType(Text), findsNWidgets(7));
      expect(find.byType(GestureDetector), findsNWidgets(7));
    });
  });
}
