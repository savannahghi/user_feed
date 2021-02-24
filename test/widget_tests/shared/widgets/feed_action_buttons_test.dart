import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/widgets/feed_action_buttons.dart';

import '../../../mocks.dart';

void main() {
  group('Feed action buttons', () {
    testWidgets('should render primary button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final String buttonText = 'Primary Button';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedPrimaryButton(
          onPressed: addOne,
          text: buttonText,
        )),
      ));

      expect(find.byType(RawMaterialButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });
    testWidgets(
        'primary button assertion throws error when onPressed or text is null',
        (WidgetTester tester) async {
      expect(
          () => FeedPrimaryButton(
                onPressed: null,
                text: null,
                customChild: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should render secondary button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final String buttonText = 'Primary Button';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedSecondaryButton(
          onPressed: addOne,
          text: buttonText,
          addBorder: true,
        )),
      ));

      expect(find.byType(OutlineButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(OutlineButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets(
        'Secondary button assertion throws error when onPressed or text is null',
        (WidgetTester tester) async {
      expect(
          () => FeedSecondaryButton(
                onPressed: null,
                text: null,
                customChild: null,
              ),
          throwsAssertionError);
    });

    testWidgets('should render no border button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final String buttonText = 'Primary Button';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedNoBorderButton(
          onPressed: addOne,
          text: buttonText,
        )),
      ));

      expect(find.byType(FlatButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FlatButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets(
        'no border button assertion throws error when onPressed or text is null',
        (WidgetTester tester) async {
      expect(
          () => FeedNoBorderButton(
                onPressed: null,
                text: null,
              ),
          throwsAssertionError);
    });

    testWidgets(
        'should render feed action button correctly with a primary action',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final Function addOneAnonymously = () => integers.add(2);

      final String buttonText = 'Verify Email';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedActionButton(
          action: mockFeedPrimaryAction,
          isAnonymous: true,
          flavour: 'PRO',
          customFunction: addOne,
          isAnonymousFunc: addOneAnonymously,
        )),
      ));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets(
        'should render feed action button correctly with a secondary action',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final Function addOneAnonymously = () => integers.add(2);

      final String buttonText = 'Verify Email';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedActionButton(
          action: mockFeedSecondaryAction,
          isAnonymous: true,
          flavour: 'PRO',
          customFunction: addOne,
          isAnonymousFunc: addOneAnonymously,
        )),
      ));

      expect(find.byType(FeedSecondaryButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FeedSecondaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 2);
    });

    testWidgets('should show coming soon if now allow function is provided',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final Function addOneAnonymously = () => integers.add(2);

      final String buttonText = 'Verify Email';
      mockFeedSecondaryAction['allowAnonymous'] = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedActionButton(
          action: mockFeedSecondaryAction,
          isAnonymous: true,
          flavour: 'PRO',
          customFunction: addOne,
          isAnonymousFunc: addOneAnonymously,
        )),
      ));

      expect(find.byType(FeedSecondaryButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FeedSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming Soon!'), findsOneWidget);
    });

    testWidgets('should return default feed primary action for other actions',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);
      final Function addOneAnonymously = () => integers.add(2);

      final String buttonText = 'Default Action';
      mockFeedSecondaryAction['allowAnonymous'] = false;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedActionButton(
          action: mockFeedOverflowAction,
          isAnonymous: true,
          flavour: 'PRO',
          customFunction: addOne,
          isAnonymousFunc: addOneAnonymously,
        )),
      ));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);
      expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coming Soon!'), findsOneWidget);
    });
    testWidgets(
        'FeedActionButtonAssertion throws error when onPressed or text is null',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      final Function addOne = () => integers.add(1);

      mockFeedSecondaryAction['allowAnonymous'] = false;
      expect(
          () => FeedActionButton(
                action: mockFeedOverflowAction,
                isAnonymous: true,
                flavour: 'PRO',
                customFunction: addOne,
                isAnonymousFunc: null,
              ),
          throwsException);
    });
  });
}
