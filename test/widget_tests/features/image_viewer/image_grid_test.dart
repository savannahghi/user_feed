import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sil_feed/features/image_viewer/image_grid.dart';
import 'package:sil_feed/shared/router_generator.dart';
import 'package:sil_feed/shared/utils/widget_keys.dart';
import 'package:sil_feed/shared/widgets/constants.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('FeedItemImageGrid page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();
    const String appFlavor = 'PRO';

    testWidgets('should render images grid correctly',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: Scaffold(
            body: FeedItemImageGrid(
              images: <Map<String, dynamic>>[
                <String, dynamic>{
                  'url': fallbackUrl,
                }
              ],
              flavour: appFlavor,
            ),
          ),
        ));

        await tester.pumpAndSettle();

        // verify ui renders correctly
        expect(find.byKey(feedImageGridPageKey), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(StaggeredGridView), findsOneWidget);
        expect(find.byKey(Key(fallbackUrl)), findsOneWidget);

        // tap image & verify navigation
        await tester.tap(find.byKey(Key(fallbackUrl)));
        await tester.pumpAndSettle();
        verify(mockObserver.didPush(any, any));
      });
    });

    testWidgets('should render empty container when there are no images',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: Scaffold(
            body: FeedItemImageGrid(
              images: <Map<String, dynamic>>[],
              flavour: appFlavor,
            ),
          ),
        ));

        await tester.pumpAndSettle();

        // verify ui renders correctly
        expect(find.byKey(feedImageGridPageKey), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(StaggeredGridView), findsNothing);
        expect(find.byKey(Key(fallbackUrl)), findsNothing);
      });
    });
  });
}
