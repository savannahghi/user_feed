import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_feed/shared/widgets/feed_global_action_bar.dart';

import '../../../mocks.dart';

void main() {
  group('FeedGlobalActionBar', () {

    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Builder(builder: (BuildContext context) {
          return Scaffold(
              body: FeedGlobalActionBar(
                  globalActionsData: globalActionsData,
                  flavour: professionalFlavor,
                  isAnonymous: false));
        }),
      ));

      expect(find.byType(FeedGlobalActionBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Row), findsWidgets);
    });

    // testWidgets('should render correctly with consumer flavour',
    //     (WidgetTester tester) async {
    //   await provideMockedNetworkImages(() async {
    //     await tester.pumpWidget(MaterialApp(
    //       home: Scaffold(
    //         body: FeedGlobalActionBar(
    //           flavour: consumerFlavor,
    //           globalActionsData: globalActionsData,
    //           isAnonymous: false,
    //         ),
    //       ),
    //     ));

    //     expect(find.byType(SingleChildScrollView), findsWidgets);
    //     expect(find.byType(Row), findsWidgets);
    //     expect(find.byType(SvgPicture), findsWidgets);
    //   });
    // });

    testWidgets('should show assertion error',
        (WidgetTester tester) async {
      expect(
          () => FeedGlobalActionBar(
                flavour: consumerFlavor,
                globalActionsData: globalActionsData,
                isAnonymous: true,
              ),
          throwsException);
    });

    // testWidgets('should be tapped', (WidgetTester tester) async {
    // final List<dynamic> globalActionsData = <dynamic>[mockFeedItem];

    //   await tester.pumpWidget(MaterialApp(
    //     home: Scaffold(
    //       body: FeedGlobalActionBar(
    //         flavour: professionalFlavor,
    //         globalActionsData: globalActionsData,
    //         isAnonymous: false,
    //         isAnonymousFunc: () => true,
    //       ),
    //     ),
    //   ));

    //   final Finder actionText =
    //       find.byKey(const Key('1ns2o6OE33iubBhPjhyQnks4znv'));
    //   await tester.tap(actionText);

    //   await tester.pumpAndSettle();
    //   //expect(find.byType(SnackBar), findsOneWidget);
    // });
  });
}
