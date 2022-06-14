// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as htmlparser;

// Project imports:
import 'package:user_feed/src/presentation/widgets/feed_item_detail_view.dart';
import 'package:user_feed/user_feed.dart';
import '../../../mock_data.dart';
import '../../../mocks.dart';

dynamic customRender(
  RenderContext context,
  Widget parsedChild,
) {}

Widget? imageHtmlRender(
  RenderContext context,
  Map<String, String> attributes,
  dom.Element? element,
) {
  return null;
}

bool imageSourceMatcher(
  Map<String, String> attributes,
  dom.Element? element,
) {
  return true;
}

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('Feed item detail view', () {
    testWidgets('widgets are rendered correctly with text plain',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemContentView(
                feedItem: mockFeedItem,
                itemTextType: TextType.PLAIN,
                summary: '---------------This is a summary',
                text: feedItemBody,
                videos: emptyMockFeedLinks,
                featureImage: '',
              );
            }),
          ),
        )));
        expect(find.byType(FeedItemContentView), findsOneWidget);
      });
    });

    testWidgets('widgets are rendered correctly with html',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemContentView(
                feedItem: mockFeedItem,
                itemTextType: TextType.HTML,
                summary: summary,
                text: '<a href="https://github.com">Github</a>',
                videos: emptyMockFeedLinks,
                featureImage: 'https://github.com',
              );
            }),
          ),
        )));
        expect(find.byType(FeedItemContentView), findsOneWidget);
      });
    });

    testWidgets('should call state callbacks', (WidgetTester tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(MaterialApp(home: Material(
          child: Scaffold(
            body: Builder(builder: (BuildContext context) {
              return FeedItemContentView(
                feedItem: mockFeedItem,
                itemTextType: TextType.HTML,
                summary: summary,
                text: '<a href="https://github.com">Github</a>',
                videos: notEmptyMockFeedLinks,
                featureImage: '',
              );
            }),
          ),
        )));

        expect(find.byType(FeedItemContentView), findsOneWidget);

        final State<StatefulWidget> state = tester.allStates.singleWhere(
            (State<StatefulWidget> el) =>
                el.toString() == 'FeedItemContentViewState');
        expect(state, isNotNull);

        final FeedItemContentViewState _state =
            state as FeedItemContentViewState;

        expect(_state, isNotNull);
        const String htmlData = '''<div><h1>Demo Page</h1></div>''';

        final dom.Document document = htmlparser.parse(htmlData);
        final RenderContext renderContext = RenderContext(
          buildContext: MockBuildContext(),
          style: Style(),
          tree: StyledElement(
            children: <StyledElement>[],
            style: Style(),
            node: dom.Element.html(htmlData),
          ),
          parser: HtmlParser(
            customRenders: const <bool Function(RenderContext), CustomRender>{},
            htmlData: document,
            onImageError: (Object exception, StackTrace? stackTrace) {},
            onImageTap: null,
            onLinkTap: null,
            style: <String, Style>{'test': Style()},
            shrinkWrap: false,
            key: null,
            tagsList: const <String>[],
            selectable: true,
            onCssParseError: (String css, List<dynamic> errors) {
              return null;
            },
            onAnchorTap: null,
          ),
        );

        expect(
            () => _state.onBodyLinkOrImageTapCallback('http://example.com',
                renderContext, <String, String>{'test': 'attributes'}, null),
            returnsNormally);

        expect(() => _state.navigateWithPopCallback(), returnsNormally);
      });
    });
  });
}
