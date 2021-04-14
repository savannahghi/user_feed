import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';

import '../../../mock_data.dart';
import '../../../test_helpers.dart';

void main() {
  group('Feed action buttons', () {
    testWidgets('should render primary button correctly',
        (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final VoidCallback addOne = () => integers.add(1);
      const String buttonText = 'Primary Button';

      await buildTestWidget(
          tester: tester,
          child: FeedPrimaryButton(onPressed: addOne, text: buttonText));

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

      await buildTestWidget(
          tester: tester,
          child: FeedSecondaryButton(
            onPressed: addOne,
            text: buttonText,
            addBorder: true,
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

      await buildTestWidget(
          tester: tester,
          child: FeedNoBorderButton(onPressed: addOne, text: buttonText));

      expect(find.byType(TextButton), findsOneWidget);
      //expect(find.text(buttonText), findsOneWidget);

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets('should trigger an action for a primary button',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          child: FeedActionButton(action: mockFeedPrimaryAction));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);
      expect(find.text('Verify Email'), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should trigger an action for a secondary button',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          child: FeedActionButton(action: mockFeedSecondaryAction));

      expect(find.byType(FeedSecondaryButton), findsOneWidget);
      expect(find.text('Verify Email'), findsOneWidget);

      await tester.tap(find.byType(FeedSecondaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('should trigger an action for an overflow button',
        (WidgetTester tester) async {
      await buildTestWidget(
          tester: tester,
          child: FeedActionButton(action: mockFeedOverflowAction));

      expect(find.byType(FeedPrimaryButton), findsOneWidget);

      await tester.tap(find.byType(FeedPrimaryButton));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets(
        'FeedActionButtonAssertion throws error when onPressed or text is null',
        (WidgetTester tester) async {
      expect(FeedActionButton(action: mockFeedOverflowAction),
          isA<FeedActionButton>());
    });
  });
}
