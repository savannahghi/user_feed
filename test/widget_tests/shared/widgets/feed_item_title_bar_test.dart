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
            author: mockFeeditem['author'],
            iconUrl: mockFeeditem['icon']['url'],
            itemID: mockFeeditem['itemID'],
            tagline: mockFeeditem['tagline'],
            timestamp: mockFeeditem['timestamp'],
          )),
        ));
        expect(
            find.text(
              mockFeeditem['author'],
            ),
            findsOneWidget);
        expect(
            find.text(
              mockFeeditem['tagline'],
            ),
            findsOneWidget);
        expect(find.text(mockFeeditem['timestamp']), findsOneWidget);
      });
    });
  });
}
