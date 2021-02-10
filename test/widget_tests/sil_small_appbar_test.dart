import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/widgets/sil_small_appbar.dart';

import '../mocks.dart';

void main() {
  group('SILSmallAppbar', () {
    final String appbarTitle = 'small appbar';
    final List<String> tabtitles = <String>['Test', 'Coverage', '100%'];
    testWidgets('should render a normal appbar correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(appBar: SILSmallAppBar(title: appbarTitle)),
      ));

      // check for the necessary items in the appbar
      expect(find.text(appbarTitle.toUpperCase()), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byType(PreferredSize), findsNothing);
    });

    testWidgets('should render an appbar with tabs',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: SILSmallAppBar(
            title: appbarTitle,
            tabTitles: tabtitles,
          ),
        ),
      ));

      // check for the necessary items in the appbar
      expect(find.text(appbarTitle.toUpperCase()), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);
      expect(find.byType(PreferredSize), findsOneWidget);
      expect(find.byType(TabBar), findsOneWidget);
      expect(find.byType(Tab), findsNWidgets(tabtitles.length));
    });

    testWidgets('should navigate to back route when provided',
        (WidgetTester tester) async {
      MockNavigatorObserver navigatorObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        initialRoute: MockRoutes.route2,
        onGenerateRoute: MockRouteGenerator.generateRoute,
        navigatorObservers: <NavigatorObserver>[navigatorObserver],
        home: Scaffold(
          appBar: SILSmallAppBar(
            title: appbarTitle,
            tabTitles: tabtitles,
          ),
        ),
      ));

      // check for the necessary items in the appbar
      expect(find.byType(IconButton), findsOneWidget);
      expect(find.byIcon(Icons.arrow_back), findsOneWidget);

      // tap the back button
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(find.byType(SILSmallAppBar), findsOneWidget);
    });

    testWidgets('should throw error when title is null',
        (WidgetTester tester) async {
      // verify throws assertion Error when title is null
      expect(
          () => MaterialApp(
                home: Scaffold(
                  appBar: SILSmallAppBar(
                    title: null,
                    tabTitles: tabtitles,
                  ),
                ),
              ),
          throwsAssertionError);
    });
  });
}
