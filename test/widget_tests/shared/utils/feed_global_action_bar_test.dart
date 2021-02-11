import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/widgets/constants.dart';
import 'package:sil_feed/shared/widgets/feed_global_action_bar.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('FeedGlobalActionBar', () {
    final List<dynamic> globalActions = <dynamic>[mockFeeditem];
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FeedGlobalActionBar(
            flavour: professionalString,
            globalActions: globalActions,
            isAnonymous: null,
          ),
        ),
      ));

      expect(find.byType(SingleChildScrollView), findsWidgets);
      expect(find.byType(Row), findsWidgets);
    });

    testWidgets('should render correctly with consumer flavour',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: FeedGlobalActionBar(
              flavour: consumerFlavor,
              globalActions: globalActions,
              isAnonymous: null,
            ),
          ),
        ));

        expect(find.byType(SingleChildScrollView), findsWidgets);
        expect(find.byType(Row), findsWidgets);
        expect(find.byType(SvgPicture), findsWidgets);
      });
    });

    testWidgets('should show assertion error', (WidgetTester tester) async {
      expect(
          () => FeedGlobalActionBar(
                flavour: consumerFlavor,
                globalActions: globalActions,
                isAnonymous: true,
                isAnonymousFunc: null,
              ),
          throwsException);
    });

    testWidgets('should be tapped', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: FeedGlobalActionBar(
            flavour: professionalString,
            globalActions: globalActions,
            isAnonymous: false,
            isAnonymousFunc: null,
          ),
        ),
      ));

      Finder actionText = await find.byKey(Key('1ns2oCuWbdA67Qv94XNRM3IXejh'));
      await tester.tap(actionText);

      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
