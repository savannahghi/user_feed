import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:user_feed/src/presentation/widgets/feed_item_title_bar.dart';

import '../../../mock_data.dart';

void main() {
  group('FeedItemTitleBar', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(const MaterialApp(
          home: Scaffold(
              body: FeedItemTitleBar(
            author: author,
            iconUrl: iconUrl,
            itemID: itemID,
            timestamp: timestamp,
          )),
        ));
      });

      expect(
          find.text(
            author,
          ),
          findsOneWidget);
      expect(find.text(timestamp), findsOneWidget);
    });
  });
}
