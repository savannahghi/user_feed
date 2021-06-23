import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:user_feed/src/domain/resources/inputs.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/core/feed.dart';
import 'package:user_feed/src/presentation/widgets/feed_cover_mini_card.dart';
import 'package:user_feed/src/presentation/widgets/feed_item_cover_action.dart';
import 'package:shared_ui_components/buttons.dart';

import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

void main() {
  group('FeedItemComponent', () {
    testWidgets(
      'should render correctly for consumer many nudges',
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
                  hasCover: true,
                ),
              );
            });
          },
        );
      },
    );

    testWidgets(
      'should render correctly for consumer one nudge',
      (WidgetTester tester) async {
        await tester.runAsync(
          () async {
            await mockNetworkImages(() async {
              await buildTestWidget(
                tester: tester,
                child: FeedComponent(
                  userFeed: FeedResponsePayload.fromJson(
                      mockFeedResponsePayload(
                          <Map<String, dynamic>>[feedNudges[0]])),
                  flavour: Flavour.CONSUMER,
                  feedContentCallbacks: mockGetFeedActionCallbacks(),
                  isSmallScreen: true,
                  hasCover: true,
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
                  hasCover: false,
                ),
              );
            });

            expect(find.byType(FeedItemCoverCallToAction), findsOneWidget);
            expect(find.text(coverCallToActionTitle), findsOneWidget);

            await tester.tap(find.byType(SILPrimaryButton));
          },
        );
      },
    );

    testWidgets(
      'should render mini card correctly',
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
                  hasCover: true,
                ),
              );
            });

            expect(find.byType(CoverMiniCard), findsOneWidget);

            expect(find.text(yourVirtualCard), findsOneWidget);
            expect(find.byKey(miniCardKey), findsOneWidget);
            await tester.tap(find.byKey(miniCardKey));
          },
        );
      },
    );
  });
}
