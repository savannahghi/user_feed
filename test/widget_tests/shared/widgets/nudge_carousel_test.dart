import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/shared/utils/widget_keys.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_feed/shared/widgets/nudge_carousel.dart';
import '../../../mock_utils.dart';
import '../../../mocks.dart';

void main() {
  group('NudgeCarousel', () {
    const String kCompleteIndividualRiderKYC = 'COMPLETE_INDIVIDUAL_RIDER_KYC';
    //final MockNavigatorObserver mockObserver = MockNavigatorObserver();
    Map<String, Function> getFeedActionCallbacks() {
      return <String, Function>{
        kCompleteIndividualRiderKYC: () {},
      };
    }

    // testWidgets('should render correctly on smallScreen on Consumer',
    //     (WidgetTester tester) async {
    //   await provideMockedNetworkImages(() async {
    //     await tester.pumpWidget(MaterialApp(
    //       home: Scaffold(
    //           body: NudgeCarousel(
    //         key: nudgeCarouselKey,
    //         flavour: consumerFlavor,
    //         isAnonymous: false,
    //         isSmallScreen: false,
    //         nudgeCarouselCallbacks: getFeedActionCallbacks(),
    //         nudges: mockFeedNudges,
    //         single: false,
    //         unroll: false,
    //         isAnonymousFunc:() =>true,
    //       )),
    //     ));

    //     // check that UI renders correctly
    //     expect(find.byType(CarouselSlider), findsOneWidget);
    //     expect(find.byKey(nudgeCarouselKey), findsOneWidget);
    //     expect(find.text('Complete your rider KYC'), findsOneWidget);
    //     expect(find.byKey(const Key('0')), findsOneWidget);
    //     expect(find.byKey(const Key('1')), findsOneWidget);
    //     expect(find.text('Complete'), findsNothing);

    //     // drag carouselItem & await rebuild
    //     await tester.drag(
    //         find.text('Complete your rider KYC'), const Offset(-1000.0, 0.0));
    //     await tester.pumpAndSettle();

    //     // confirm carousel FeedNudge item changed
    //     expect(find.text('Complete your rider KYC'), findsNothing);
    //     expect(find.text('Complete'), findsOneWidget);
    //   });
    // });

    testWidgets('should render correctly on smallScreen on Pro',
        (WidgetTester tester) async {
      await provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: NudgeCarousel(
            key: nudgeCarouselKey,
            flavour: professionalFlavor,
            isAnonymous: false,
            isSmallScreen: false,
            nudgeCarouselCallbacks: getFeedActionCallbacks(),
            nudges: mockFeedNudges,
            single: false,
            unroll: false,
          )),
        ));

        // check that UI renders correctly
        expect(find.byType(CarouselSlider), findsNothing);
        expect(find.byKey(nudgeCarouselKey), findsOneWidget);
        expect(find.text('Complete your rider KYC'), findsNothing);
        expect(find.byKey(const Key('0')), findsNothing);
        expect(find.byKey(const Key('1')), findsNothing);
        expect(find.text('Complete'), findsNothing);
      });
    });

    // testWidgets('should render independently on largeScreen on Pro',
    //     (WidgetTester tester) async {
    //   await provideMockedNetworkImages(() async {
    //     await tester.pumpWidget(MaterialApp(
    //       home: Scaffold(
    //           body: NudgeCarousel(
    //         key: nudgeCarouselKey,
    //         flavour: professionalFlavor,
    //         isAnonymous: false,
    //         isSmallScreen: false,
    //         nudgeCarouselCallbacks: getFeedActionCallbacks(),
    //         nudges: mockFeedNudges,
    //         single: true,
    //         unroll: true,
    //         isAnonymousFunc: ()=> true,
    //       )),
    //     ));

    //     // check that UI renders correctly
    //     expect(find.byType(CarouselSlider), findsNothing);
    //     expect(find.byKey(nudgeCarouselKey), findsOneWidget);
    //     expect(find.text('Complete your rider KYC'), findsOneWidget);
    //     expect(find.byKey(const Key('0')), findsNothing);
    //     expect(find.byKey(const Key('1')), findsNothing);
    //     expect(find.text('Complete'), findsOneWidget);
    //   });
    // });

    // testWidgets('tapping feedNudge navigates', (WidgetTester tester) async {
    //   await provideMockedNetworkImages(() async {
    //     await tester.pumpWidget(MaterialApp(
    //       navigatorObservers: <NavigatorObserver>[mockObserver],
    //       onGenerateRoute: RouteGenerator.generateRoute,
    //       home: Scaffold(
    //           body: NudgeCarousel(
    //         key: nudgeCarouselKey,
    //         flavour: consumerFlavor,
    //         isAnonymous: false,
    //         isSmallScreen: false,
    //         nudgeCarouselCallbacks: getFeedActionCallbacks(),
    //         nudges: mockFeedNudges,
    //         single: false,
    //         unroll: false,
    //         isAnonymousFunc: ()=> true,
    //       )),
    //     ));

    //     // check that UI renders correctly
    //     expect(find.byType(CarouselSlider), findsOneWidget);
    //     expect(find.byKey(nudgeCarouselKey), findsOneWidget);
    //     expect(find.text('Complete your rider KYC'), findsOneWidget);
    //     expect(find.byKey(const Key('0')), findsOneWidget);
    //     expect(find.byKey(const Key('1')), findsOneWidget);
    //     expect(find.text('Complete'), findsNothing);

    //     // tap FeedNudge item navigates
    //     expect(find.byKey(feedActionButtonKey), findsOneWidget);
    //     await tester.tap(find.byKey(feedActionButtonKey));
    //     await tester.pumpAndSettle();
    //     expect(find.byType(NudgeCarousel), findsOneWidget);
    //   });
    //});
  });
}
