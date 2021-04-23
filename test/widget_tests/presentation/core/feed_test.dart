import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sil_feed/src/domain/resources/inputs.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/presentation/core/feed.dart';

import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

void main() {
  group('FeedItemComponent', () {
    // testWidgets(
    //   'should render correctly for consumer',
    //   (WidgetTester tester) async {
    //     await tester.runAsync(
    //       () async {
    //         await mockNetworkImages(() async {
    //           await buildTestWidget(
    //             tester: tester,
    //             child: FeedComponent(
    //               userFeed:
    //                   FeedResponsePayload.fromJson(mockFeedResponsePayload),
    //               flavour: Flavour.CONSUMER,
    //               feedContentCallbacks: mockGetFeedActionCallbacks(),
    //               isSmallScreen: true,
    //             ),
    //           );
    //         });
    //       },
    //     );
    //   },
    // );

    testWidgets(
      'should render correctly for pro',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await mockNetworkImages(() async {
              await buildTestWidget(
                tester: tester,
                flavour: Flavour.PRO,
                child: FeedComponent(
                  userFeed:
                      FeedResponsePayload.fromJson(mockFeedResponsePayload),
                  flavour: Flavour.PRO,
                  feedContentCallbacks: mockGetFeedActionCallbacks(),
                  isSmallScreen: true,
                ),
              );
            });

            expect(find.text(completeProfileTitle), findsOneWidget);
          },
        );
      },
    );
  });
}
