import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_feed/constants/constants.dart';

import '../../../mocks.dart';

void main() {
  group('FeedUtils', () {
    test('should title case a sentence', () {
      final String sentence = 'the test coverage';
      final String expectedFormattedSentence = 'The Test Coverage';
      final String actualFormattedSentence = FeedUtils.titleCase(sentence);
      expect(actualFormattedSentence, expectedFormattedSentence);
    });

    test('should return an empty string if a sentence is null or not a string',
        () {
      final String expectedFormattedSentence = '';
      final String actualFormattedSentence = FeedUtils.titleCase(null);
      expect(actualFormattedSentence, expectedFormattedSentence);
      expect(actualFormattedSentence, isA<String>());
    });

    test(
        'should remove underscores, '
        'convert to uppercase and title case a sentence', () {
      final String sentence = 'test_coverage_failure';
      final String expectedSentence = 'Test Coverage Failure';
      final String actualFormattedSentence =
          FeedUtils.removeUnderscores(sentence);
      expect(actualFormattedSentence, expectedSentence);
      expect(actualFormattedSentence, isA<String>());
    });

    test(
        'should return "Just Now" if the'
        ' time difference is less than a minute', () {
      final String date = DateTime.now().toIso8601String();
      final String expectedReadableDate = 'Just now';
      final String readableDate = FeedUtils.getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return the amount of time '
        'passed if the difference is less than a day', () {
      final String date =
          DateTime.now().subtract(Duration(minutes: 2)).toIso8601String();
      final String expectedReadableDate =
          DateFormat('jm').format(DateTime.parse(date));
      final String readableDate = FeedUtils.getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return yesterday and the exact time'
        ' if the difference is 1 day', () {
      final String date =
          DateTime.now().subtract(Duration(days: 1)).toIso8601String();
      final String expectedReadableDate =
          'Yesterday, ' + DateFormat('jm').format(DateTime.parse(date));
      final String readableDate = FeedUtils.getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return the weekday and the time'
        ' if the difference is less than 4 days', () {
      final String date =
          DateTime.now().subtract(Duration(days: 3)).toIso8601String();
      final String expectedReadableDate =
          '${DateFormat('EEEE').format(DateTime.parse(date))}, ' +
              DateFormat('jm').format(DateTime.parse(date));
      final String readableDate = FeedUtils.getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return the actual date and the time'
        ' if the difference is more than 4 days', () {
      final String date =
          DateTime.now().subtract(Duration(days: 30)).toIso8601String();
      final String expectedReadableDate =
          DateFormat('MMMd, yyyy').format(DateTime.parse(date));
      final String readableDate = FeedUtils.getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test('should check on allow anonymous before calling a function', () {
      final List<int> integers = <int>[];
      final Function updateIntegersAnonymously = () => integers.add(1);
      final Function updateIntegersNormally = () => integers.add(2);

      bool isAnonymous = true;
      bool allowAnonymous = true;

      FeedUtils.checkOnAllowAnonymousBeforeCall(
          allowFunc: updateIntegersAnonymously,
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: updateIntegersNormally);

      expect(integers.isEmpty, false);
      expect(integers.first, 1);

      /// cleanup the list before performing the next test
      integers.clear();
      allowAnonymous = false;
      FeedUtils.checkOnAllowAnonymousBeforeCall(
          allowFunc: updateIntegersAnonymously,
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: updateIntegersNormally);
      expect(integers.isEmpty, false);
      expect(integers.first, 2);

      integers.clear();
      isAnonymous = false;
      FeedUtils.checkOnAllowAnonymousBeforeCall(
          allowFunc: updateIntegersAnonymously,
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: updateIntegersNormally);
      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    test('should get a feed item action url', () {
      String actionName = kResolveItem;
      expect(FeedUtils.getFeedItemActionIconUrl(actionName), resolveIconUrl);
      actionName = kHideItem;
      expect(FeedUtils.getFeedItemActionIconUrl(actionName), hideIconUrl);
      actionName = kPinItem;
      expect(FeedUtils.getFeedItemActionIconUrl(actionName), pinIconUrl);
      actionName = 'Other string';
      expect(FeedUtils.getFeedItemActionIconUrl(actionName), resolveIconUrl);
    });

    test('should process feed media', () {
      final List<dynamic> images = FeedUtils.processFeedMedia(
          links: mockFeedLinks, mediaType: MediaType.pngImage);
      expect(images, isA<List<dynamic>>());
      expect(images.isEmpty, false);
      expect(images.length, 1);

      final List<dynamic> videos = FeedUtils.processFeedMedia(
          links: mockFeedLinks, mediaType: MediaType.youtubeVideo);
      expect(videos, isA<List<dynamic>>());
      expect(videos.isEmpty, false);
      expect(videos.length, 1);

      final List<dynamic> documents = FeedUtils.processFeedMedia(
          links: mockFeedLinks, mediaType: MediaType.pdfDocument);
      expect(documents, isA<List<dynamic>>());
      expect(documents.isEmpty, false);
      expect(documents.length, 1);

      expect(
          () => FeedUtils.processFeedMedia(
              links: null, mediaType: MediaType.pdfDocument),
          throwsException);
    });
  });
}
