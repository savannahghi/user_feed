import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/widgets/feed_action_buttons.dart';
import 'package:sil_feed/shared/widgets/feed_item_action_bar.dart';

import '../../../mocks.dart';

void main() {
  group('FeedItemActionBar  group tests', () {
    testWidgets('should test feed_item_action_bar renderes correctly',
        (WidgetTester tester) async {
      dynamic genericFunc({required String flavour, required String itemID}) {}

      await tester.pumpWidget(MaterialApp(
          home: FeedItemActionBar(
        actions: mockFeedItemActions,
        feedItemID: '',
        hideFunction: genericFunc,
        resolveFunction: genericFunc,
        pinFunction: genericFunc,
        flavour: 'CONSUMER',
        isAnonymous: false,
        isAnonymousFunc: () {},
      )));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));
      await tester.pumpAndSettle();
    });
  });
}
