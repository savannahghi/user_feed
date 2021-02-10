import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/utils/utils.dart';

void main() {
  group('FeedUtils', () {
    testWidgets('should show a snackbar', (WidgetTester tester) async {
      List<int> ints = <int>[];
      Function addOne = () => ints.add(1);
      const String snackbarText = 'Test coverage achieved';
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(builder: (BuildContext context) {
            return Container(
              decoration:
                  BoxDecoration(gradient: getFeedGlobalActionGradient(context)),
              child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).showSnackBar(FeedUtils.snackbar(
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

      expect(ints.isEmpty, false);
      expect(ints.first, 1);
    });
  });
}
