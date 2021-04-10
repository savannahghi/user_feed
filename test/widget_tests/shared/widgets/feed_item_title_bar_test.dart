import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_title_bar.dart';

import '../../../mocks.dart';

void main() {
  group('FeedItemTitleBar', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(const MaterialApp(
            home: Scaffold(
                body: FeedItemTitleBar(
              author: author,
              iconUrl: iconUrl,
              itemID: itemID,
              tagline: tagline,
              timestamp: timestamp,
            )),
          )));
      expect(
          find.text(
            author,
          ),
          findsOneWidget);
      expect(
          find.text(
            tagline,
          ),
          findsOneWidget);
      expect(find.text(timestamp), findsOneWidget);
    });
  });
}
