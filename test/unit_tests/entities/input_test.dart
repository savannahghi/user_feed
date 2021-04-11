import 'package:flutter_test/flutter_test.dart';

import 'package:sil_feed/src/domain/resources/inputs.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';

import '../../mock_data.dart';

void main() {
  group('FeedResponsePayload', () {
    test(
      'should return object from json',
      () {
        final Map<String, dynamic> feed = <String, dynamic>{
          'id': '1ns2oCuWbdA67Qv94XNRM3IXejh',
          'sequenceNumber': 1001,
          'uid': '1ns2oCuWbdA67Qv94XNRM3IXejh',
          'isAnonymous': false,
          'flavour': 'PRO',
          'actions': <Map<String, dynamic>>[mockFeedAction.toJson()],
          'items': <Map<String, dynamic>>[mockFeedItem.toJson()],
          'nudges': <Map<String, dynamic>>[mockNudge1.toJson()],
        };

        final Map<String, dynamic> payload = <String, dynamic>{
          'data': <String, dynamic>{
            'getFeed': feed,
          },
        };

        final FeedResponsePayload _payload =
            FeedResponsePayload.fromJson(payload);

        expect(_payload, isA<FeedResponsePayload>());
        expect(_payload.data.getFeed.nudges!.length, 1);
        expect(_payload.data.getFeed.items!.length, 1);
      },
    );

    test('should return feed from json', () {
      final Map<String, dynamic> feed = <String, dynamic>{
        'data': <String, dynamic>{
          'getFeed': <String, dynamic>{
            'uid': 'LMqDCyyciFMWHfOsvYa76L6dya73',
            'isAnonymous': false,
            'flavour': Flavour.PRO.name,
            'actions': <dynamic>[
              <String, dynamic>{
                'id': '1nO8hIc8ZXThjaqmQFL1XHVXgCp',
                'sequenceNumber': 1,
                'name': 'SEARCH_PATIENT',
                'actionType': ActionType.SECONDARY.name,
                'handling': Handling.FULL_PAGE.name,
                'allowAnonymous': false
              }
            ],
            'nudges': <dynamic>[
              <String, dynamic>{
                'id': '1608729954',
                'sequenceNumber': 1608729964,
                'visibility': Visibility.SHOW.name,
                'status': Status.PENDING.name,
                'title': 'Complete your rider KYC',
                'text':
                    'Fill in your Be.Well business KYC in order to start transacting',
                'actions': <dynamic>[
                  <String, dynamic>{
                    'id': '1608647889',
                    'sequenceNumber': 1608647899,
                    'name': 'COMPLETE_INDIVIDUAL_RIDER_KYC',
                    'actionType': ActionType.PRIMARY.name,
                    'handling': Handling.FULL_PAGE.name,
                    'allowAnonymous': false
                  }
                ],
                'groups': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
                'users': <String>['hOcaUv8dqqgmWYf9HEhjdudgf0b2'],
                'links': <dynamic>[
                  <String, dynamic>{
                    'id': '1608729974',
                    'url': 'https://assets.healthcloud.co.ke/bewell_logo.png',
                    'linkType': LinkType.PNG_IMAGE.name
                  }
                ],
                'notificationChannels': <String>['EMAIL', 'FCM'],
              },
            ],
            'items': <dynamic>[]
          },
        }
      };

      final FeedResponsePayload _feed = FeedResponsePayload.fromJson(feed);

      expect(_feed.data, isNotNull);
      expect(_feed.data.getFeed, isNotNull);

      expect(_feed.data.getFeed.actions!.length, 1);
    });
  });
}
