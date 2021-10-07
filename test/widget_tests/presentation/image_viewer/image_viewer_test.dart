// Flutter imports:
import 'dart:io';

import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_view/photo_view.dart';

// Project imports:
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/presentation/image_viewer/image_viewer.dart';

import '../../../mock_utils.dart';

void main() {
  group('FeedImageViewer page', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      HttpOverrides.global = TestHttpOverrides();
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
