import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/presentation/widgets/feed_action_buttons.dart';
import 'package:sil_feed/src/presentation/widgets/feed_nudge.dart';

import '../../../mocks.dart';

void main() {
  group('FeedNudge', () {
    testWidgets('renders correctly and does not throw an error',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MaterialApp(
            home: Scaffold(
              body: FeedNudge(
                  flavor: professionalFlavor,
                  isAnonymous: true,
                  nudge: nudge,
                  isAnonymousFunc: () {}),
            ),
          )));
      expect(find.text('Complete your rider KYC'), findsOneWidget);
      expect(
          find.text(
              'Fill in your Be.Well business KYC in order to start transacting'),
          findsOneWidget);
      expect(find.byType(FeedActionButton), findsOneWidget);
    });

    // testWidgets(
    //     'throw an error when isAnonymous is true and isAnonymousFunc is null ',
    //     (WidgetTester tester) async {
    // await mockNetworkImagesFor(()  async {
    //     expect(
    //         () => FeedNudge(
    //               flavor: consumerFlavor,
    //               isAnonymous: true,
    //               nudge: nudge,
    //               isAnonymousFunc: (){},
    //             ),
    //         throwsException);
    //     expect(find.byType(FeedActionButton), findsNothing);
    //   });
    // });
  });
}
