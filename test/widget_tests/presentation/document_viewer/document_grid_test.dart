import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'package:user_feed/src/domain/entities/link.dart';

import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/presentation/document_viewer/document_grid.dart';
import 'package:user_feed/src/presentation/router/router_generator.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';

import '../../../mock_data.dart';
import '../../../mocks.dart';

void main() {
  group('Feed Document List page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render document list correctly',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            MaterialApp(
              onGenerateRoute: RouteGenerator.generateRoute,
              navigatorObservers: <NavigatorObserver>[mockObserver],
              home: Scaffold(
                body: FeedItemDocumentGrid(
                  documents: <Link>[mockPdfLink],
                  flavour: Flavour.PRO,
                ),
              ),
            ),
          );
        });

        // verify UI renders correctly
        expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
        expect(find.byType(ListView), findsWidgets);
        expect(find.byKey(feedDocumentsListContainerKey), findsOneWidget);

        expect(find.byKey(const Key('How do you get your kids to take meds?')),
            findsOneWidget);

        await tester.tap(
            find.byKey(const Key('How do you get your kids to take meds?')));

        await tester.pump();
      });
    });

    testWidgets('should render empty container when documents are empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        navigatorObservers: <NavigatorObserver>[mockObserver],
        home: const Scaffold(
          body: FeedItemDocumentGrid(
            documents: <Link>[],
            flavour: Flavour.PRO,
          ),
        ),
      ));

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
      expect(find.byType(ListView), findsWidgets);
      expect(find.byKey(feedDocumentsListEmptyContainerKey), findsOneWidget);
      expect(find.byKey(feedDocumentsListContainerKey), findsNothing);
    });
  });
}
