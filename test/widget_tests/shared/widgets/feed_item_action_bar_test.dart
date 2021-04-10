import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/feed_type_defs.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';
import 'package:sil_feed/src/presentation/widgets/feed_item_action_bar.dart';

import '../../../mock_data.dart';

void main() {
  feedItemActionTypeDef genericFunc({Function? func}) {
    return ({required Flavour flavour, required String itemID}) {
      if (func != null) {
        return func();
      }
      return;
    };
  }

  group('FeedItemActionBar', () {
    testWidgets('should resolve feed item', (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function addOneAnonymously = () => integers.add(2);

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          hideFunction: genericFunc(),
          pinFunction: genericFunc(),
          flavour: Flavour.CONSUMER,
          isAnonymous: false,
          isAnonymousFunc: addOneAnonymously,
          resolveFunction: genericFunc(func: addOne),
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kResolveItem)));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should resolve feed item for anonymous user',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function addOneAnonymously = () => integers.add(2);

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          hideFunction: genericFunc(),
          pinFunction: genericFunc(),
          flavour: Flavour.CONSUMER,
          isAnonymous: true,
          isAnonymousFunc: addOneAnonymously,
          resolveFunction: genericFunc(func: addOne),
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kResolveItem)));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 2);
    });

    testWidgets('should pin feed item', (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function addOneAnonymously = () => integers.add(2);

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          hideFunction: genericFunc(),
          flavour: Flavour.CONSUMER,
          isAnonymous: false,
          isAnonymousFunc: addOneAnonymously,
          resolveFunction: genericFunc(),
          pinFunction: genericFunc(func: addOne),
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kPinItem)));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should pin feed item for anonymous user',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function addOneAnonymously = () => integers.add(2);

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          hideFunction: genericFunc(),
          flavour: Flavour.CONSUMER,
          isAnonymous: true,
          isAnonymousFunc: addOneAnonymously,
          resolveFunction: genericFunc(),
          pinFunction: genericFunc(func: addOne),
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kPinItem)));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 2);
    });

    testWidgets('should hide feed item', (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function addOneAnonymously = () => integers.add(2);

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          pinFunction: genericFunc(),
          flavour: Flavour.CONSUMER,
          isAnonymous: false,
          isAnonymousFunc: addOneAnonymously,
          resolveFunction: genericFunc(),
          hideFunction: genericFunc(func: addOne),
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kHideItem)));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should hide feed item for anonymous user',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function addOneAnonymously = () => integers.add(2);

      await tester.pumpWidget(
          MaterialApp(home: Builder(builder: (BuildContext context) {
        return FeedItemActionBar(
          actions: mockFeedItemActions,
          feedItemID: '1',
          pinFunction: genericFunc(),
          flavour: Flavour.CONSUMER,
          isAnonymous: true,
          isAnonymousFunc: addOneAnonymously,
          resolveFunction: genericFunc(),
          hideFunction: genericFunc(func: addOne),
        );
      })));
      final Finder feedItemBarButton = find.byType(FeedNoBorderButton);
      expect(feedItemBarButton, findsNWidgets(3));

      await tester.tap(find.byKey(const Key(kHideItem)));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 2);
    });
  });
}
