import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sil_feed/src/presentation/widgets/feed_zero_state.dart';

void main() {
  group('Feed Zero State', () {
    testWidgets('renders zero state correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FeedZeroState(
              key: Key('zero_state'),
              subtitle: 'zero_state_subtitle',
            ),
          ),
        ),
      );

      expect(find.byType(FeedZeroState), findsOneWidget);
      expect(find.text('zero_state_subtitle'), findsOneWidget);
    });
  });
}
