import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:network_image_mock/network_image_mock.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/presentation/document_viewer/document_grid.dart';
import 'package:sil_feed/src/presentation/router/router_generator.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('Feed Document List page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render document list correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorObservers: <NavigatorObserver>[mockObserver],
            home: const Scaffold(
              body: FeedItemDocumentGrid(
                documents: <Map<String, dynamic>>[
                  <String, dynamic>{
                    'url': fallbackUrl,
                    'title': 'some title',
                    'thumbnail': fallbackUrl
                  }
                ],
                flavour: professionalFlavor,
              ),
            ),
          )));

      await tester.pumpAndSettle();

      // verify UI renders correctly
      expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
      expect(find.byType(ListView), findsWidgets);
      expect(find.byKey(const Key('some title')), findsOneWidget);

      // tap a document & confirm navigation
      await tester.tap(find.byKey(const Key('some title')));
      await tester.pump();
    });

    testWidgets('should render empty container when documents are empty',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: const Scaffold(
            body: FeedItemDocumentGrid(
              documents: <Map<String, dynamic>>[],
              flavour: professionalFlavor,
            ),
          ),
        ));

        await tester.pumpAndSettle();

        // verify UI renders correctly
        expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
        expect(find.byType(ListView), findsWidgets);
        expect(find.byKey(const Key('some title')), findsNothing);
      });
    });
  });
}
