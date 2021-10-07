// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

// Project imports:
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/user_feed.dart';
import '../../../mock_data.dart';

void main() {
  group('FeedItemComponent', () {
    testWidgets('widgets are rendered correctly ', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.runAsync(() async {
          await tester.pumpWidget(MaterialApp(home: Material(
            child: Scaffold(
              body: Builder(builder: (BuildContext context) {
                return FeedItemComponent(feedItem: mockFeedItem);
              }),
            ),
          )));
          await tester.pump(const Duration(seconds: 6));
          expect(find.byType(FeedItemTitleBar), findsOneWidget);
          expect(find.byType(FeedItemBody), findsOneWidget);
          expect(find.byKey(feedItemInkWell), findsOneWidget);
          await tester.tap(find.byKey(feedItemInkWell));
          await tester.pump(const Duration(seconds: 6));
        });
      });
    });

    testWidgets('widgets are rendered correctly without video',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemComponent(feedItem: mockFeedItem2);
            }),
          ),
        )));
        expect(find.byType(FeedItemTitleBar), findsOneWidget);
        expect(find.byType(FeedItemBody), findsOneWidget);
        await tester.tap(find.byKey(feedItemInkWell));
        await tester.pump(const Duration(seconds: 3));
      });
    });
  });
}
