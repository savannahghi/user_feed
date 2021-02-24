import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/widgets/feed_item_comment_card.dart';

import '../../../mocks.dart';

void main() {
  group('FeedItemCommentCard', () {
    final List<dynamic> globalAction = <dynamic>[];
    mockFeedItem
        .forEach((String k, dynamic v) => globalAction.add(mockFeedItem));

    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FeedItemCommentCard(
            senderName: 'John',
            threadBody: 'Hey',
            timeStamp: '2021-02-01T07:30:50Z',
          ),
        ),
      )); 
      expect(find.text('John'), findsOneWidget);
      expect(find.text('Hey'), findsOneWidget);
      expect(find.text('2021-02-01T07:30:50Z'), findsOneWidget);
    });
  });
}
