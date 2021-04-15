import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';

import 'package:sil_feed/src/presentation/widgets/feed_global_action_bar.dart';

import '../../../mock_data.dart';

void main() {
  group('FeedGlobalActionBar', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
              body: FeedGlobalActionBar(
            globalActionsData: globalActionsData,
            flavour: Flavour.PRO,
          ));
        }),
      ));

      expect(find.byType(FeedGlobalActionBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('should show assertion error', (WidgetTester tester) async {
      expect(
          FeedGlobalActionBar(
            flavour: Flavour.CONSUMER,
            globalActionsData: globalActionsData,
          ),
          isA<FeedGlobalActionBar>());
    });
  });
}
