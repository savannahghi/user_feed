import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/presentation/image_viewer/image_grid.dart';
import 'package:sil_feed/src/presentation/router/router_generator.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';

import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('FeedItemImageGrid page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render images grid correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorObservers: <NavigatorObserver>[mockObserver],
            home: Scaffold(
              body: FeedItemImageGrid(
                images: <Link>[mockImageLink],
                flavour: Flavour.CONSUMER,
              ),
            ),
          )));

      await tester.pumpAndSettle();

      // verify ui renders correctly
      expect(find.byKey(feedImageGridPageKey), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(StaggeredGridView), findsOneWidget);
    });

    testWidgets('should render empty container when there are no images',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: const Scaffold(
            body: FeedItemImageGrid(
              images: <Link>[],
              flavour: Flavour.CONSUMER,
            ),
          ),
        ));

        await tester.pumpAndSettle();

        // verify ui renders correctly
        expect(find.byKey(feedImageGridPageKey), findsOneWidget);
        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(StaggeredGridView), findsNothing);
        expect(find.byKey(const Key(fallbackUrl)), findsNothing);
      });
    });
  });
}
