import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_detail_view.dart';

import '../../../mock_data.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('Feed item detail view', () {
    testWidgets('widgets are rendered correctly with text plain',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemContentView(
                feedItem: mockFeedItem,
                itemTextType: TextType.PLAIN,
                summary: summary,
                text: feedItemBody,
              );
            }),
          ),
        )));
        expect(find.byType(FeedItemContentView), findsOneWidget);
        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();
      });
    });

    testWidgets('widgets are rendered correctly with html',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemContentView(
                feedItem: mockFeedItem,
                itemTextType: TextType.HTML,
                summary: summary,
                text: '<a href="https://github.com">Github</a>',
              );
            }),
          ),
        )));
        expect(find.byType(FeedItemContentView), findsOneWidget);
      });
    });
  });
}
