import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:sil_feed/src/domain/resources/inputs.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/presentation/core/feed.dart';

import 'package:sil_feed/src/presentation/widgets/feed_item_cover_action.dart';
import 'package:sil_ui_components/sil_buttons.dart';

import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

void main() {
  group('FeedItemComponent', () {
    testWidgets(
      'should render correctly for consumer',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await mockNetworkImages(() async {
              await buildTestWidget(
                tester: tester,
                child: FeedComponent(
                  userFeed: FeedResponsePayload.fromJson(
                      mockFeedResponsePayload(feedNudges)),
                  flavour: Flavour.CONSUMER,
                  feedContentCallbacks: mockGetFeedActionCallbacks(),
                  isSmallScreen: true,
                ),
              );
            });
          },
        );
      },
    );

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
                  userFeed: FeedResponsePayload.fromJson(
                      mockFeedResponsePayload(feedNudges)),
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

    testWidgets(
      'should render correctly empty nudges',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await mockNetworkImages(() async {
              await buildTestWidget(
                tester: tester,
                flavour: Flavour.PRO,
                child: FeedComponent(
                  userFeed: FeedResponsePayload.fromJson(
                      mockFeedResponsePayload(<Map<String, dynamic>>[])),
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

    testWidgets(
      'should render correctly cover call to action',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await mockNetworkImages(() async {
              await buildTestWidget(
                tester: tester,
                child: FeedComponent(
                  userFeed: FeedResponsePayload.fromJson(
                      mockFeedResponsePayload(<Map<String, dynamic>>[])),
                  flavour: Flavour.CONSUMER,
                  feedContentCallbacks: mockGetFeedActionCallbacks(),
                  isSmallScreen: true,
                ),
              );
            });

            expect(find.byType(FeedItemCoverCallToAction), findsOneWidget);
            expect(find.text(coverCallToActionTitle), findsOneWidget);
            expect(find.text(coverCallToActionBody), findsOneWidget);

            await tester.tap(find.byType(SILPrimaryButton));
            await tester.tap(find.byType(SILSecondaryButton));
          },
        );
      },
    );
  });
}
