import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_feed/shared/widgets/feed_action_buttons.dart';
import 'package:sil_feed/shared/widgets/feed_nudge.dart';

import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('FeedNudge', () {
    testWidgets('renders correctly and does not throw an error',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: FeedNudge(
                flavor: professionalFlavor,
                isAnonymous: true,
                nudge: mockFeedNudges[0],
                isAnonymousFunc: () {}),
          ),
        ));
        expect(find.text(mockFeedNudges[0]['title']), findsOneWidget);
        expect(find.text(mockFeedNudges[0]['text']), findsOneWidget);
        expect(find.byType(FeedActionButton), findsOneWidget);
      });
    });

    testWidgets(
        'throw an error when isAnonymous is true and isAnonymousFunc is null ',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        expect(
            () => FeedNudge(
                  flavor: consumerFlavor,
                  isAnonymous: true,
                  nudge: mockFeedNudges[0],
                  isAnonymousFunc: null,
                ),
            throwsException);
        expect(find.byType(FeedActionButton), findsNothing);
      });
    });
  });
}
