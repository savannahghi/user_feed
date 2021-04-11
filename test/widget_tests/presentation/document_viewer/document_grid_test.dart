import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:network_image_mock/network_image_mock.dart';
import 'package:sil_feed/src/domain/entities/link.dart';

import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/presentation/document_viewer/document_grid.dart';
import 'package:sil_feed/src/presentation/router/router_generator.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';

import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('Feed Document List page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render document list correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
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
        ),
      );

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
      expect(find.byType(ListView), findsWidgets);
      expect(find.byKey(feedDocumentsListContainerKey), findsOneWidget);
    });

    testWidgets('should render empty container when documents are empty',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
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
  });
}
