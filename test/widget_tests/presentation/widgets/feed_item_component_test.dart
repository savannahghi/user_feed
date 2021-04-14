import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/domain/value_objects/feed_type_defs.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';

import '../../../mock_data.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('FeedItemComponent', () {
    testWidgets('widgets are rendered correctly ', (WidgetTester tester) async {
      await tester.runAsync(() async {
        feedItemActionTypeDef genericFunc() {
          return ({required Flavour flavour, required String itemID}) {};
        }

        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemComponent(
                feedItem: mockFeedItem,
                flavour: Flavour.CONSUMER,
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

    testWidgets(
        'FeedItemCommentCard is rendered if the reply to in the conversations is empty ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        feedItemActionTypeDef genericFunc() {
          return ({required Flavour flavour, required String itemID}) {};
        }

        await tester.pumpWidget(MaterialApp(
            home: Material(
          child: Scaffold(
            body: FeedItemComponent(
              feedItem: mockFeedItem,
              flavour: Flavour.PRO,
              hideFunction: genericFunc(),
              isAnonymous: false,
              isAnonymousFunc: genericFunc(),
              pinFunction: genericFunc(),
              postedByName: 'JOHN',
              postedByUID: '12345',
              resolveFunction: genericFunc(),
              tetherThread: false,
            ),
          ),
        )));
        await tester.pump();
        expect(find.byType(FeedItemCommentCard), findsWidgets);
        expect(find.text('Replies . '), findsWidgets);
      });
    });

    testWidgets('should render ScaffoldMessenger if comment empty ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        feedItemActionTypeDef genericFunc() {
          return ({required Flavour flavour, required String itemID}) {};
        }

        await tester.pumpWidget(MaterialApp(
            home: Material(
          child: Scaffold(
            body: FeedItemComponent(
              feedItem: mockFeedItem,
              flavour: Flavour.PRO,
              hideFunction: genericFunc(),
              isAnonymous: false,
              isAnonymousFunc: genericFunc(),
              pinFunction: genericFunc(),
              postedByName: 'JOHN',
              postedByUID: '12345',
              resolveFunction: genericFunc(),
              tetherThread: false,
            ),
          ),
        )));
        await tester.pump();
        expect(find.byType(FeedItemCommentCard), findsWidgets);
        expect(find.text('Replies . '), findsWidgets);

        expect(find.byKey(addCommentIconButtonKey), findsOneWidget);
        await tester.tap(find.byKey(addCommentIconButtonKey));
        await tester.pump();

        expect(find.byType(ScaffoldMessenger), findsOneWidget);
      });
    });

    testWidgets('should add comment successfully ',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        feedItemActionTypeDef genericFunc() {
          return ({required Flavour flavour, required String itemID}) {};
        }

        await tester.pumpWidget(MaterialApp(
            home: Material(
          child: Scaffold(
            body: FeedItemComponent(
              feedItem: mockFeedItem,
              flavour: Flavour.PRO,
              hideFunction: genericFunc(),
              isAnonymous: false,
              isAnonymousFunc: genericFunc(),
              pinFunction: genericFunc(),
              postedByName: 'JOHN',
              postedByUID: '12345',
              resolveFunction: genericFunc(),
              tetherThread: false,
            ),
          ),
        )));
        await tester.pump();
        expect(find.byType(FeedItemCommentCard), findsWidgets);
        expect(find.text('Replies . '), findsWidgets);

        await tester.enterText(
            find.byKey(addCommentTextFormKey), 'This is a comment');

        expect(find.byKey(addCommentIconButtonKey), findsOneWidget);
        await tester.tap(find.byKey(addCommentIconButtonKey));
        await tester.pump();

        expect(find.byType(ScaffoldMessenger), findsOneWidget);
      });
    });
  });
}
