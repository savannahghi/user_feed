import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/entities/action.dart' as feed_action;
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';

import '../../../mock_data.dart';

void main() {
  group('Feed action buttons', () {
    testWidgets('should render primary button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final VoidCallback addOne = () => integers.add(1);
      const String buttonText = 'Primary Button';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedPrimaryButton(
          onPressed: addOne,
          text: buttonText,
        )),
      ));

      expect(find.byType(RawMaterialButton), findsOneWidget);
      // expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should render secondary button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final VoidCallback addOne = () => integers.add(1);
      const String buttonText = 'Primary Button';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedSecondaryButton(
          onPressed: addOne,
          text: buttonText,
          addBorder: true,
        )),
      ));

      expect(find.byType(OutlinedButton), findsOneWidget);
      //expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(OutlinedButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should render no border button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final VoidCallback addOne = () => integers.add(1);
      const String buttonText = 'Primary Button';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: FeedNoBorderButton(
          onPressed: addOne,
          text: buttonText,
        )),
      ));

      expect(find.byType(TextButton), findsOneWidget);
      //expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should allow anonymous user to trigger default action',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FeedActionButton(
            action: mockFeedPrimaryAction,
            flavour: Flavour.PRO,
            customFunction: addOne,
          ),
        ),
      ));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should not allow anonymous user to trigger default action',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);

      final feed_action.Action _mockFeedPrimaryAction =
          mockFeedPrimaryAction.copyWith.call(allowAnonymous: false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FeedActionButton(
            action: _mockFeedPrimaryAction,
            flavour: Flavour.PRO,
            customFunction: addOne,
          ),
        ),
      ));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should trigger default action', (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FeedActionButton(
            action: mockFeedPrimaryAction,
            flavour: Flavour.PRO,
            customFunction: addOne,
          ),
        ),
      ));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets(
        'FeedActionButtonAssertion throws error when onPressed or text is null',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];

      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);

      expect(
          FeedActionButton(
            action: mockFeedOverflowAction,
            flavour: Flavour.PRO,
            customFunction: addOne,
          ),
          isA<FeedActionButton>());
    });
  });
}
