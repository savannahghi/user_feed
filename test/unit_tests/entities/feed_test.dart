import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/src/domain/entities/feed.dart';
import 'package:sil_feed/src/domain/entities/item.dart';

import '../../mock_data.dart';

void main() {
  group('Feed', () {
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

        final Feed _feed = Feed.fromJson(feed);
        expect(_feed.actions!.length, 1);
        expect(_feed.items, isA<List<Item>>());
        expect(_feed.nudges!.length, 1);
        expect(_feed.items!.length, 1);
      },
    );
  });
}
