import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:sil_feed/src/constants/constants.dart';
import 'package:sil_feed/src/shared/utils/utils.dart';

import '../../../mocks.dart';

void main() {
  group('FeedUtils', () {
    test('should title case a sentence', () {
      const String sentence = 'the test coverage';
      const String expectedFormattedSentence = 'The Test Coverage';
      final String actualFormattedSentence = titleCase(sentence);
      expect(actualFormattedSentence, expectedFormattedSentence);
    });

    test(
        'should remove underscores, '
        'convert to uppercase and title case a sentence', () {
      const String sentence = 'test_coverage_failure';
      const String expectedSentence = 'Test Coverage Failure';
      final String actualFormattedSentence = removeUnderscores(sentence);
      expect(actualFormattedSentence, expectedSentence);
      expect(actualFormattedSentence, isA<String>());
    });

    test(
        'should return "Just Now" if the'
        ' time difference is less than a minute', () {
      final String date = DateTime.now().toIso8601String();
      const String expectedReadableDate = 'Just now';
      final String readableDate = getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return the amount of time '
        'passed if the difference is less than a day', () {
      final String date =
          DateTime.now().subtract(const Duration(minutes: 2)).toIso8601String();
      final String expectedReadableDate =
          DateFormat('jm').format(DateTime.parse(date));
      final String readableDate = getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return yesterday and the exact time'
        ' if the difference is 1 day', () {
      final String date =
          DateTime.now().subtract(const Duration(days: 1)).toIso8601String();
      final String expectedReadableDate =
          'Yesterday, ${DateFormat('jm').format(DateTime.parse(date))}';
      final String readableDate = getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return the weekday and the time'
        ' if the difference is less than 4 days', () {
      final String date =
          DateTime.now().subtract(const Duration(days: 3)).toIso8601String();
      final String expectedReadableDate =
          '${'${DateFormat('EEEE').format(DateTime.parse(date))}, '}${DateFormat('jm').format(DateTime.parse(date))}';
      final String readableDate = getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test(
        'should return the actual date and the time'
        ' if the difference is more than 4 days', () {
      final String date =
          DateTime.now().subtract(const Duration(days: 30)).toIso8601String();
      final String expectedReadableDate =
          DateFormat('MMMd, yyyy').format(DateTime.parse(date));
      final String readableDate = getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test('displayProgressMessage succefully', () {
      const String progress = '20';
      final String message = displayProgress(progress);
      expect(message, 'Your profile is $progress% complete, complete it now');
    });

    test('should check on allow anonymous before calling a function', () {
      final List<int> integers = <int>[];
      // ignore: prefer_function_declarations_over_variables
      final Function updateIntegersAnonymously = () => integers.add(1);
      // ignore: prefer_function_declarations_over_variables
      final Function updateIntegersNormally = () => integers.add(2);

      bool isAnonymous = true;
      bool allowAnonymous = true;

      checkOnAllowAnonymousBeforeCall(
          allowFunc: updateIntegersAnonymously,
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: updateIntegersNormally);

      expect(integers.isEmpty, false);
      expect(integers.first, 1);

      /// cleanup the list before performing the next test
      integers.clear();
      allowAnonymous = false;
      checkOnAllowAnonymousBeforeCall(
          allowFunc: updateIntegersAnonymously,
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: updateIntegersNormally);
      expect(integers.isEmpty, false);
      expect(integers.first, 2);

      integers.clear();
      isAnonymous = false;
      checkOnAllowAnonymousBeforeCall(
          allowFunc: updateIntegersAnonymously,
          isAnonymous: isAnonymous,
          allowAnonymous: allowAnonymous,
          isAnonymousFunc: updateIntegersNormally);
      expect(integers.isEmpty, false);
      expect(integers.first, 1);
    });

    test('should get a feed item action url', () {
      String actionName = kResolveItem;
      expect(getFeedItemActionIconUrl(actionName), resolveIconUrl);
      actionName = kHideItem;
      expect(getFeedItemActionIconUrl(actionName), hideIconUrl);
      actionName = kPinItem;
      expect(getFeedItemActionIconUrl(actionName), pinIconUrl);
      actionName = 'Other string';
      expect(getFeedItemActionIconUrl(actionName), resolveIconUrl);
    });

    test('should process feed media', () {
      final List<dynamic> images =
          processFeedMedia(links: mockFeedLinks, mediaType: MediaType.pngImage);
      expect(images, isA<List<dynamic>>());
      expect(images.isEmpty, false);
      expect(images.length, 1);

      final List<dynamic> videos = processFeedMedia(
          links: mockFeedLinks, mediaType: MediaType.youtubeVideo);
      expect(videos, isA<List<dynamic>>());
      expect(videos.isEmpty, false);
      expect(videos.length, 1);

      final List<dynamic> documents = processFeedMedia(
          links: mockFeedLinks, mediaType: MediaType.pdfDocument);
      expect(documents, isA<List<dynamic>>());
      expect(documents.isEmpty, false);
      expect(documents.length, 1);
    });
  });
}
