import 'package:flutter_test/flutter_test.dart';

import 'package:sil_feed/src/domain/resources/inputs.dart';

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
      final FeedResponsePayload _feed =
          FeedResponsePayload.fromJson(mockFeedResponsePayload);

      expect(_feed.data, isNotNull);
      expect(_feed.data.getFeed, isNotNull);

      expect(_feed.data.getFeed.actions!.length, 3);
    });
  });
}
