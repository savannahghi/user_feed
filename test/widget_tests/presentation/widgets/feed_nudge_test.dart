import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';
import 'package:sil_feed/src/presentation/widgets/feed_nudge.dart';

import '../../../mock_data.dart';

void main() {
  group('FeedNudge', () {
    testWidgets('renders correctly and does not throw an error',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: FeedNudge(nudge: nudge),
          ),
        ));
      });

      expect(find.text('Complete your rider KYC'), findsOneWidget);
      expect(
          find.text(
              'Fill in your Be.Well business KYC in order to start transacting'),
          findsOneWidget);
      expect(find.byType(FeedActionButton), findsOneWidget);
    });
  });
}
