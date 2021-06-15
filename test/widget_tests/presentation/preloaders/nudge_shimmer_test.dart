import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/presentation/preloaders/nudge_shimmer.dart';

void main() {
  testWidgets('Should show preloaders for consumer',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  NudgeShimmer(padding: 20.0),
                ],
              ),
            );
          },
        ),
      ),
    );

    expect(find.byType(NudgeShimmer), findsOneWidget);
  });
}
