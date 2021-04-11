import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';

void main() {
  group('FeedUtils', () {
    testWidgets('should show a snackbar', (WidgetTester tester) async {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function addOne = () => integers.add(1);
      const String snackbarText = 'Test coverage achieved';
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return Container(
              decoration:
                  BoxDecoration(gradient: getFeedGlobalActionGradient(context)),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(snackbar(
                      content: snackbarText,
                      callback: addOne,
                      label: 'Ok Thanks!'));
                },
              ),
            );
          }),
        ),
      ));

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

    // testWidgets(
    //   'should callFeedAction from consumer ',
    //   (WidgetTester tester) async {
    //     await tester.runAsync(
    //       () async {
    //         await tester.pumpWidget(
    //           MaterialApp(
    //             home: Material(
    //               child: Scaffold(
    //                 body: Builder(
    //                   builder: (BuildContext context) {
    //                     return TextButton(
    //                       onPressed: () => callFeedAction(
    //                           context: context,
    //                           flavour: Flavour.CONSUMER,
    //                           fullActionName: 'kGetMedicine'),
    //                       child: const Text('btn'),
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );

    //         await tester.pumpAndSettle();
    //         expect(find.byType(TextButton), findsWidgets);

    //         await tester.tap(find.byType(TextButton));
    //         await tester.pumpAndSettle();
    //       },
    //     );
    //   },
    // );
  });
}
