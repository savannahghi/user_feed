import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sil_feed/shared/utils/sizing.dart';

void main() {
  group('Vertical Sized Boxes', () {
    testWidgets('should show vertical SizedBoxes', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              extremelySmallVerticalSizedBox,
              verySmallVerticalSizedBox,
              smallVerticalSizedBox,
              size15VerticalSizedBox,
              mediumVerticalSizedBox,
              largeVerticalSizedBox,
              size40VerticalSizedBox,
              veryLargeVerticalSizedBox,
              extremelyLargeVerticalSizedBox,
              size100VerticalSizedBox,
              size70VerticalSizedBox,
              size120VerticalSizedBox
            ],
          ),
        ),
      ));

      expect(find.byWidget(extremelySmallVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(verySmallVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(smallVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(size15VerticalSizedBox), findsOneWidget);
      expect(find.byWidget(mediumVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(largeVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(size40VerticalSizedBox), findsOneWidget);
      expect(find.byWidget(veryLargeVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(extremelyLargeVerticalSizedBox), findsOneWidget);
      expect(find.byWidget(size100VerticalSizedBox), findsOneWidget);
      expect(find.byWidget(size70VerticalSizedBox), findsOneWidget);
      expect(find.byWidget(size120VerticalSizedBox), findsOneWidget);
    });
  });

  group('Horizontal Sized Boxes', () {
    testWidgets('should show horizontal SizedBoxes',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              verySmallHorizontalSizedBox,
              smallHorizontalSizedBox,
              size15HorizontalSizedBox,
              mediumHorizontalSizedBox,
              largeHorizontalSizedBox,
              size40HorizontalSizedBox,
              veryLargeHorizontalSizedBox
            ],
          ),
        ),
      ));

      expect(find.byWidget(verySmallHorizontalSizedBox), findsOneWidget);
      expect(find.byWidget(smallHorizontalSizedBox), findsOneWidget);
      expect(find.byWidget(size15HorizontalSizedBox), findsOneWidget);
      expect(find.byWidget(mediumHorizontalSizedBox), findsOneWidget);
      expect(find.byWidget(largeHorizontalSizedBox), findsOneWidget);
      expect(find.byWidget(size40HorizontalSizedBox), findsOneWidget);
      expect(find.byWidget(veryLargeHorizontalSizedBox), findsOneWidget);
    });
  });
}
