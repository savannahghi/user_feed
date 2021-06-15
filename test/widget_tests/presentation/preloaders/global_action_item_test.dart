import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/presentation/preloaders/global_action_item_shimmer.dart';

void main() {
  testWidgets(
    'Should show global action item shimmer',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: ListView(
                  shrinkWrap: true,
                  children: const <Widget>[
                    GlobalActionItemShimmerRow(horizontalPadding: 20.0),
                  ],
                ),
              );
            },
          ),
        ),
      );

      expect(find.byType(GlobalActionItemShimmer), findsNWidgets(3));
    },
  );
}
