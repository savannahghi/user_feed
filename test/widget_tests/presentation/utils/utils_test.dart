import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/application/helpers/utils.dart';
import 'package:user_feed/user_feed.dart';

import '../../../test_helpers.dart';

void main() {
  group('FeedUtils', () {
    testWidgets('should show a snackbar', (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      const String snackbarText = 'Test coverage achieved';

      await buildTestWidget(
        tester: tester,
        child: Builder(
          builder: (BuildContext context) {
            return Container(
              decoration:
                  BoxDecoration(gradient: getFeedGlobalActionGradient(context)),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackbar(
                        content: snackbarText,
                        callback: addOne,
                        label: 'Ok Thanks!'),
                  );
                },
              ),
            );
          },
        ),
      );

      expect(find.byType(GestureDetector), findsOneWidget);

      await tester.tap(find.byType(GestureDetector));
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text(snackbarText), findsOneWidget);
      expect(find.byType(SnackBarAction), findsOneWidget);

      await tester.tap(find.byType(SnackBarAction));
      await tester.pumpAndSettle();

      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    testWidgets(
      'should execute a feed action from consumer ',
      (WidgetTester tester) async {
        final List<bool> callSequence = <bool>[];

        await buildTestWidget(
          tester: tester,
          customCallbacks: <String, Function>{
            kGetMedicine: () {
              callSequence.add(true);
            }
          },
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => callFeedAction(
                    context: context, fullActionName: kGetMedicine),
                child: const Text('btn'),
              );
            },
          ),
        );

        expect(find.byType(GestureDetector), findsWidgets);

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(callSequence.isNotEmpty, true);

        // the function should be called once
        expect(callSequence.length, 1);
        expect(callSequence, <bool>[true]);

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(callSequence.isNotEmpty, true);

        // the function should be called once
        expect(callSequence.length, 2);
        expect(callSequence, <bool>[true, true]);
      },
    );

    testWidgets(
      'should show a snackbar if the specified action is not contained in '
      'our predefined list of CONSUMER actions',
      (WidgetTester tester) async {
        final List<bool> callSequence = <bool>[];

        await buildTestWidget(
          tester: tester,
          customCallbacks: <String, Function>{
            'someUnknownAction': () {
              callSequence.add(true);
            }
          },
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => callFeedAction(
                    context: context, fullActionName: kGetMedicine),
                child: const Text('btn'),
              );
            },
          ),
        );

        expect(find.byType(GestureDetector), findsWidgets);

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(callSequence.isEmpty, true);
        expect(callSequence.length, 0);

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );

    testWidgets(
      'should execute a feed action from PRO ',
      (WidgetTester tester) async {
        final List<bool> callSequence = <bool>[];

        await buildTestWidget(
          tester: tester,
          flavour: Flavour.PRO,
          customCallbacks: <String, Function>{
            kAddPatient: () {
              callSequence.add(true);
            }
          },
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => callFeedAction(
                    context: context, fullActionName: kAddPatient),
                child: const Text('btn'),
              );
            },
          ),
        );

        expect(find.byType(GestureDetector), findsWidgets);

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(callSequence.isNotEmpty, true);

        // the function should be called once
        expect(callSequence.length, 1);
        expect(callSequence, <bool>[true]);
      },
    );

    testWidgets(
      'should show a snackbar if the specified action is not contained in '
      'our predefined list of PRO actions',
      (WidgetTester tester) async {
        final List<bool> callSequence = <bool>[];

        await buildTestWidget(
          tester: tester,
          flavour: Flavour.PRO,
          customCallbacks: <String, Function>{
            'someUnknownAction': () {
              callSequence.add(true);
            }
          },
          child: Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () => callFeedAction(
                    context: context, fullActionName: kAddPatient),
                child: const Text('btn'),
              );
            },
          ),
        );

        expect(find.byType(GestureDetector), findsWidgets);

        await tester.tap(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(callSequence.isEmpty, true);
        expect(callSequence.length, 0);

        expect(find.byType(SnackBar), findsOneWidget);
      },
    );
  });
}
