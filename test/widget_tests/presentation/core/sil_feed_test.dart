import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/resources/inputs.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/domain/value_objects/feed_type_defs.dart';
import 'package:sil_feed/src/domain/value_objects/strings.dart';
import 'package:sil_feed/src/presentation/core/feed.dart';

import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../mock_image_http_client.dart';

void main() {
  setUpAll(() {
    HttpOverrides.global = MockTestHttpOverrides();
  });

  group(
    'FeedItemComponent',
    () {
      // testWidgets(
      //   'should render correctly for consumer',
      //   (WidgetTester tester) async {
      //     await tester.runAsync(
      //       () async {
      //         feedItemActionTypeDef genericFunc() {
      //           return ({required Flavour flavour, required String itemID}) {};
      //         }

      //         await tester.pumpWidget(
      //           MaterialApp(
      //             home: Material(
      //               child: Scaffold(
      //                 body: Builder(
      //                   builder: (BuildContext context) {
      //                     return FeedComponent(
      //                       userFeed: FeedResponsePayload.fromJson(
      //                           mockFeedResponsePayload),
      //                       flavour: Flavour.CONSUMER,
      //                       hideFunction: genericFunc(),
      //                       isAnonymousFunc: genericFunc(),
      //                       pinFunction: genericFunc(),
      //                       postedByName: 'JOHN',
      //                       postedByUID: '12345',
      //                       resolveFunction: genericFunc(),
      //                       tetherThread: false,
      //                       feedContentCallbacks: mockGetFeedActionCallbacks(),
      //                       isSmallScreen: true,
      //                     );
      //                   },
      //                 ),
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // );

      testWidgets(
        'should render correctly for pro',
        (WidgetTester tester) async {
          await tester.runAsync(
            () async {
              feedItemActionTypeDef genericFunc() {
                return ({required Flavour flavour, required String itemID}) {};
              }

              await tester.pumpWidget(
                MaterialApp(
                  home: Material(
                    child: Scaffold(
                      body: Builder(
                        builder: (BuildContext context) {
                          return FeedComponent(
                            userFeed: FeedResponsePayload.fromJson(
                                mockFeedResponsePayload),
                            flavour: Flavour.PRO,
                            hideFunction: genericFunc(),
                            isAnonymousFunc: genericFunc(),
                            pinFunction: genericFunc(),
                            postedByName: 'JOHN',
                            postedByUID: '12345',
                            resolveFunction: genericFunc(),
                            tetherThread: false,
                            feedContentCallbacks: mockGetFeedActionCallbacks(),
                            isSmallScreen: true,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
              expect(find.text(completeProfileTitle), findsOneWidget);
            },
          );
        },
      );
    },
  );
}
