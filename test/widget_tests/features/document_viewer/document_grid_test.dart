import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sil_feed/features/document_viewer/pages/document_grid.dart';
import 'package:sil_feed/shared/router_generator.dart';
import 'package:sil_feed/shared/utils/widget_keys.dart';
import 'package:sil_feed/shared/widgets/constants.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('Feed Document List page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render document list correctly',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: Scaffold(
            body: FeedItemDocumentGrid(
              documents: <Map<String, dynamic>>[
                <String, dynamic>{
                  'url': fallbackUrl,
                  'title': 'some title',
                  'thumbnail': fallbackUrl
                }
              ],
              flavour: professionalString,
            ),
          ),
        ));

        await tester.pumpAndSettle();

        // verify UI renders correctly
        expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
        expect(find.byType(ListView), findsWidgets);
        expect(find.byKey(Key('some title')), findsOneWidget);

        // tap a document & confirm naviagtion
        await tester.tap(find.byKey(Key('some title')));
        verify(mockObserver.didPush(any, any));
      });
    });

    testWidgets('should render empty container when documents are empty',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: Scaffold(
            body: FeedItemDocumentGrid(
              documents: <Map<String, dynamic>>[],
              flavour: professionalString,
            ),
          ),
        ));

        await tester.pumpAndSettle();

        // verify UI renders correctly
        expect(find.byKey(feedDocumentsListPageKey), findsOneWidget);
        expect(find.byType(ListView), findsWidgets);
        expect(find.byKey(Key('some title')), findsNothing);
      });
    });
  });
}
