import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/constants/constants.dart';
import 'package:sil_feed/src/shared/type_defs/feed_type_defs.dart';
import 'package:sil_feed/src/shared/widgets/feed_action_buttons.dart';
import 'package:sil_feed/src/shared/widgets/feed_item_action_bar.dart';

import '../../../mocks.dart';

void main() {
  group('FeedItemActionBar  group tests', () {
    testWidgets('should test feed_item_action_bar render correctly',
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

    testWidgets(
        'is anonymous func works correctly when FeedNoBorderButton pressed ',
        (WidgetTester tester) async {
      feedItemActionTypeDef genericFunc() {
        return ({required String flavour, required String itemID}) {};
      }

      bool isAnonymousFunc = false;

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          hideFunction: genericFunc(),
          resolveFunction: genericFunc(),
          pinFunction: genericFunc(),
          flavour: 'CONSUMER',
          isAnonymous: true,
          isAnonymousFunc: () {
            isAnonymousFunc = true;
          },
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kResolveItem)));
      await tester.pumpAndSettle();

      expect(isAnonymousFunc, true);
    });

    testWidgets('allow func  works correctly when resolve button  pressed',
        (WidgetTester tester) async {
      feedItemActionTypeDef genericFunc() {
        return ({required String flavour, required String itemID}) {};
      }

      bool isAnonymousFunc = false;
      String flavourTest = '';
      String itemIDTest = '';
      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
            actions: mockFeedItemActionsAllowAnonymous,
            feedItemID: '1',
            hideFunction: genericFunc(),
            pinFunction: genericFunc(),
            flavour: 'CONSUMER',
            isAnonymous: true,
            isAnonymousFunc: () {
              isAnonymousFunc = true;
            },
            resolveFunction: (
                {required String flavour, required String itemID}) {
              flavour = 'CONSUMER';
              flavourTest = flavour;
              itemID = '1';
              itemIDTest = itemID;
            });
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kResolveItem)));
      await tester.pumpAndSettle();

      expect(flavourTest, 'CONSUMER');
      expect(itemIDTest, '1');
      expect(isAnonymousFunc, false);
    });

    testWidgets('allow func  works correctly when pin button pressed',
        (WidgetTester tester) async {
      feedItemActionTypeDef genericFunc() {
        return ({required String flavour, required String itemID}) {};
      }

      bool isAnonymousFunc = false;
      String flavourTest = '';
      String itemIDTest = '';
      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
            actions: mockFeedItemActionsAllowAnonymous,
            feedItemID: '1',
            hideFunction: genericFunc(),
            pinFunction: ({required String flavour, required String itemID}) {
              flavour = 'CONSUMER';
              flavourTest = flavour;
              itemID = '1';
              itemIDTest = itemID;
            },
            flavour: 'CONSUMER',
            isAnonymous: true,
            isAnonymousFunc: () {
              isAnonymousFunc = true;
            },
            resolveFunction: genericFunc());
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kPinItem)));
      await tester.pumpAndSettle();

      expect(flavourTest, 'CONSUMER');
      expect(itemIDTest, '1');
      expect(isAnonymousFunc, false);
    });

    testWidgets('allow func  works correctly when hide button pressed',
        (WidgetTester tester) async {
      feedItemActionTypeDef genericFunc() {
        return ({required String flavour, required String itemID}) {};
      }

      bool isAnonymousFunc = false;
      String flavourTest = '';
      String itemIDTest = '';
      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
            actions: mockFeedItemActionsAllowAnonymous,
            feedItemID: '1',
            hideFunction: ({required String flavour, required String itemID}) {
              flavour = 'CONSUMER';
              flavourTest = flavour;
              itemID = '1';
              itemIDTest = itemID;
            },
            pinFunction: genericFunc(),
            flavour: 'CONSUMER',
            isAnonymous: true,
            isAnonymousFunc: () {
              isAnonymousFunc = true;
            },
            resolveFunction: genericFunc());
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kHideItem)));
      await tester.pumpAndSettle();

      expect(flavourTest, 'CONSUMER');
      expect(itemIDTest, '1');
      expect(isAnonymousFunc, false);
    });

    // testWidgets(
    //     'throws error when isAnonymous is true and isAnonymousFunc is null',
    //     (WidgetTester tester) async {
    //   feedItemActionTypeDef genericFunc() {
    //     return genericFunc();
    //   }

    //   expect(() {
    //     FeedItemActionBar(
    //         actions: mockFeedItemActionsAllowAnonymous,
    //         feedItemID: '1',
    //         hideFunction: genericFunc(),
    //         pinFunction: genericFunc(),
    //         flavour: 'CONSUMER',
    //         isAnonymous: true,
    //         isAnonymousFunc: () => {},
    //         resolveFunction: genericFunc());
    //   }, throwsA(isA<Exception>()));
    // });
  });
}
