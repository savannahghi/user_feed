import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/type_defs/feed_type_defs.dart';
import 'package:sil_feed/shared/widgets/feed_action_buttons.dart';
import 'package:sil_feed/shared/widgets/feed_item_body.dart';
import 'package:sil_feed/shared/widgets/feed_item_comment_card.dart';
import 'package:sil_feed/shared/widgets/feed_item_component.dart';
import 'package:sil_feed/shared/widgets/feed_item_title_bar.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('FeedItemComponent', () {
    testWidgets('widgets are rendered correctly ', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await provideMockedNetworkImages(() async {
          feedItemActionTypeDef genericFunc() {
            return ({required String flavour, required String itemID}) {};
          }

          await tester.pumpWidget(MaterialApp(home: Material(
            child: Scaffold(
              body: Builder(builder: (BuildContext context) {
                return FeedItemComponent(
                  feedItem: mockFeedItem,
                  flavour: 'CONSUMER',
                  hideFunction: genericFunc(),
                  isAnonymous: false,
                  isAnonymousFunc: genericFunc(),
                  pinFunction: genericFunc(),
                  postedByName: 'JOHN',
                  postedByUID: '12345',
                  resolveFunction: genericFunc(),
                  tetherThread: false,
                );
              }),
            ),
          )));
          expect(find.byType(FeedItemTitleBar), findsOneWidget);
          expect(find.byType(FeedItemBody), findsOneWidget);
          expect(find.byType(FeedNoBorderButton), findsWidgets);
          expect(find.byType(TextFormField), findsWidgets);
        });
      });
    });

    testWidgets(
        'FeedItemCommentCard is rendered if the reply to in the conversations is empty ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await provideMockedNetworkImages(() async {
          feedItemActionTypeDef genericFunc() {
            return ({required String flavour, required String itemID}) {};
          }

          await tester.pumpWidget(MaterialApp(home: Material(
            child: Scaffold(
              body: Builder(builder: (BuildContext context) {
                return FeedItemComponent(
                  feedItem: mockFeedItem,
                  flavour: 'CONSUMER',
                  hideFunction: genericFunc(),
                  isAnonymous: false,
                  isAnonymousFunc: genericFunc(),
                  pinFunction: genericFunc(),
                  postedByName: 'JOHN',
                  postedByUID: '12345',
                  resolveFunction: genericFunc(),
                  tetherThread: false,
                );
              }),
            ),
          )));
          expect(find.byType(FeedItemCommentCard), findsWidgets);
          expect(find.text('Replies . '), findsWidgets);
        });
      });
    });
  });
}
