import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/presentation/image_viewer/image_viewer.dart';


void main() {
  group('FeedImageViewer page', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: FeedImageViewer(
            imageUrl: fallbackUrl,
          ),
        ),
      ));

      await tester.pumpAndSettle();

      // verify ui renders correctly
      expect(find.byType(PhotoView), findsOneWidget);
    });
  });
}
