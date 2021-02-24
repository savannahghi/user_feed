import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/widgets/feed_item_title_bar.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('FeedItemTitleBar', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: FeedItemTitleBar(
            author: mockFeedItem['author'],
            iconUrl: mockFeedItem['icon']['url'],
            itemID: mockFeedItem['itemID'],
            tagline: mockFeedItem['tagline'],
            timestamp: mockFeedItem['timestamp'],
          )),
        ));
        expect(
            find.text(
              mockFeedItem['author'],
            ),
            findsOneWidget);
        expect(
            find.text(
              mockFeedItem['tagline'],
            ),
            findsOneWidget);
        expect(find.text(mockFeedItem['timestamp']), findsOneWidget);
      });
    });
  });
}
