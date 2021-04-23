import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/feed_store.dart';
import 'package:sil_feed/src/presentation/widgets/feed_global_action_bar.dart';

import '../../../mock_data.dart';
import '../../../test_helpers.dart';

void main() {
  group('FeedGlobalActionBar', () {
    testWidgets(
        'should render global actions correctly and make sure '
        'functions are called when the global action items are tapped',
        (WidgetTester tester) async {
      FeedStore().flavour.add(Flavour.CONSUMER);
      final List<bool> callSequence = <bool>[];
      await mockNetworkImages(() async {
        await buildTestWidget(
            tester: tester,
            customCallbacks: <String, Function>{
              kGetTest: () {
                callSequence.add(true);
              }
            },
            child: FeedGlobalActionBar(
                globalActionsData: consumerGlobalActionsData));
      });
      await tester.pump();

      expect(find.byType(FeedGlobalActionBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Row), findsWidgets);

      // expect(find.text('Get Test'), findsOneWidget);

      expect(find.byKey(const Key('34564564')), findsOneWidget);

      // tap all the button in the global actions bar and make sure it
      // is executed
      await tester.tap(find.byKey(const Key('34564564')));
      await tester.pumpAndSettle();

      expect(callSequence.isEmpty, false);
      expect(callSequence, <bool>[true]);
    });
  });
}
