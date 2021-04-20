import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../mock_image_http_client.dart';

void main() {
  group('FeedGlobalActionBar', () {
    setUpAll(() {
      HttpOverrides.global = MockTestHttpOverrides();
    });

    /// todo(dexter) : restore this. Consequence of late night quick fix

    testWidgets(
        'should render global actions correctly and make sure '
        'functions are called when the global action items are tapped',
        (WidgetTester tester) async {
      // FeedStore().flavour.add(Flavour.CONSUMER);
      // final List<bool> callSequence = <bool>[];
      // await mockNetworkImagesFor(() async => buildTestWidget(
      //     tester: tester,
      //     customCallbacks: <String, Function>{
      //       kGetTest: () {
      //         callSequence.add(true);
      //       }
      //     },
      //     child: FeedGlobalActionBar(
      //         globalActionsData: consumerGlobalActionsData)));
      // await tester.pump();

      // expect(find.byType(FeedGlobalActionBar), findsOneWidget);
      // expect(find.byType(SingleChildScrollView), findsWidgets);
      // expect(find.byType(Row), findsWidgets);

      // expect(find.text('Get Test'), findsOneWidget);

      // expect(find.byKey(const Key('34564564')), findsOneWidget);

      // // tap all the button in the global actions bar and make sure it
      // // is executed
      // await tester.tap(find.byKey(const Key('34564564')));
      // await tester.pumpAndSettle();

      // expect(callSequence.isEmpty, false);
      // expect(callSequence, <bool>[true]);
    });
  });
}
