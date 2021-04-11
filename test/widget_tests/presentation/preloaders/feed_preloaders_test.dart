import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/presentation/preloaders/feed_item_shimmer.dart';
import 'package:sil_feed/src/presentation/preloaders/feed_preloaders.dart';
import 'package:sil_feed/src/presentation/preloaders/global_action_item_shimmer.dart';
import 'package:sil_feed/src/presentation/preloaders/nudge_shimmer.dart';

void main() {
  testWidgets('Should show preloaders for consumer',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            FeedLoadingShimmer(
              flavor: Flavour.CONSUMER,
              feedItemShimmerPadding: 20,
              globalActionShimmerHorizontalPadding: 20,
              nudgeShimmerPadding: 20,
            ),
          ],
        ),
      ),
    ));

    expect(find.byType(GlobalActionItemShimmerRow), findsOneWidget);
    expect(find.byType(NudgeShimmer), findsOneWidget);
    expect(find.byType(FeedItemShimmer), findsOneWidget);
  });

  testWidgets('Should show preloaders for pro', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: const <Widget>[
            FeedLoadingShimmer(
              flavor: Flavour.PRO,
              feedItemShimmerPadding: 20,
              globalActionShimmerHorizontalPadding: 20,
              nudgeShimmerPadding: 20,
            ),
          ],
        ),
      ),
    ));

    expect(find.byType(GlobalActionItemShimmerRow), findsNothing);
    expect(find.byType(NudgeShimmer), findsOneWidget);
    expect(find.byType(FeedItemShimmer), findsOneWidget);
  });
}
