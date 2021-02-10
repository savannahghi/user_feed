import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/preloaders/feed_preloaders.dart';

void main() {
  testWidgets('Should show preloaders for consumer',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            FeedLoadingShimmer(flavor: 'CONSUMER'),
          ],
        ),
      ),
    ));

    expect(find.byType(GlobalActionItemShimmer), findsNWidgets(3));
    expect(find.byType(NudgeShimmer), findsOneWidget);
    expect(find.byType(FeedItemShimmer), findsOneWidget);
  });

  testWidgets('Should show preloaders for pro', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            FeedLoadingShimmer(flavor: 'PRO'),
          ],
        ),
      ),
    ));

    expect(find.byType(GlobalActionItemShimmer), findsNothing);
    expect(find.byType(NudgeShimmer), findsOneWidget);
    expect(find.byType(FeedItemShimmer), findsOneWidget);
  });
}
