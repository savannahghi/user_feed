import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:photo_view/photo_view.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/image_viewer/image_grid.dart';
import 'package:user_feed/src/presentation/image_viewer/image_viewer.dart';
import 'package:user_feed/src/presentation/router/router_generator.dart';

import '../../../mock_data.dart';
import '../../../mocks.dart';

void main() {
  group('FeedItemImageGrid page', () {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    testWidgets('should render images grid correctly',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          onGenerateRoute: generateRoute,
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: Scaffold(
            body: FeedItemImageGrid(
              images: <Link>[mockImageLink],
            ),
          ),
        ));
      });

      await tester.pumpAndSettle();

      // verify ui renders correctly
      expect(find.byKey(feedImageGridPageKey), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(StaggeredGridView), findsOneWidget);
      expect(
          find.byKey(const Key(
              'https://assets.healthcloud.co.ke/nudges/verify_email.png')),
          findsOneWidget);
      await tester.tap(
        find.byKey(const Key(
            'https://assets.healthcloud.co.ke/nudges/verify_email.png')),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FeedImageViewer), findsOneWidget);
      expect(find.byType(InteractiveViewer), findsOneWidget);
      expect(find.byType(PhotoView), findsOneWidget);
    });

    testWidgets('should render empty container when there are no images',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        onGenerateRoute: generateRoute,
        navigatorObservers: <NavigatorObserver>[mockObserver],
        home: const Scaffold(
          body: FeedItemImageGrid(images: <Link>[]),
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
}
