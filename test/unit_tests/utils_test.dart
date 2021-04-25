import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/asset_strings.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/enums.dart';
import 'package:sil_feed/src/presentation/router/router_generator.dart';
import 'package:sil_feed/src/presentation/router/routes.dart';

import '../mock_data.dart';

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
        'should return complete your kyc if a sentence contains '
        'the string KYC', () {
      const String sentence = 'kyc_test_coverage_failure';
      const String expectedSentence = 'Complete Your KYC';
      String actualFormattedSentence = removeUnderscores(sentence);
      expect(actualFormattedSentence, expectedSentence);
      expect(actualFormattedSentence, isA<String>());

      actualFormattedSentence = removeUnderscores('COMPLETE_YOUR_KYC');
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
          DateFormat('d MMMM, yyyy').format(DateTime.parse(date));
      final String readableDate = getHumanReadableTimestamp(date);
      expect(readableDate, expectedReadableDate);
      expect(readableDate, isA<String>());
    });

    test('displayProgressMessage successfully', () {
      const String progress = '20';
      final String message = displayProgress(progress);
      expect(message, 'Your profile is $progress% complete, complete it now');
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
      final List<Link> images =
          processFeedMedia(links: mockFeedLinks, linkType: LinkType.PNG_IMAGE);
      expect(images, isA<List<Link>>());
      expect(images.isEmpty, false);
      expect(images.length, 1);

      final List<Link> videos = processFeedMedia(
          links: mockFeedLinks, linkType: LinkType.YOUTUBE_VIDEO);
      expect(videos, isA<List<Link>>());
      expect(videos.isEmpty, false);
      expect(videos.length, 1);

      final List<Link> documents = processFeedMedia(
          links: mockFeedLinks, linkType: LinkType.PDF_DOCUMENT);
      expect(documents, isA<List<Link>>());
      expect(documents.isEmpty, false);
      expect(documents.length, 1);
    });

    test('should return router page ', () {
      final Route<dynamic> page1 = RouteGenerator.generateRoute(
          const RouteSettings(name: Routes.feedDocumentViewer));
      final Route<dynamic> page2 =
          RouteGenerator.generateRoute(const RouteSettings());
      expect(page1, isNotNull);
      expect(page2, isNotNull);
    });
  });
}
