import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:flutter_html/image_render.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/user_feed.dart';
import 'package:user_feed/src/presentation/widgets/feed_item_detail_view.dart';
import 'package:html/dom.dart' as dom;

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
) {}

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
            customRender: const <String, CustomRender>{
              'test': customRender,
            },
            htmlData: document,
            navigationDelegateForIframe: null,
            imageRenders: const <ImageSourceMatcher, ImageRender>{
              imageSourceMatcher: imageHtmlRender
            },
            onImageError: (Object exception, StackTrace? stackTrace) {},
            onImageTap: null,
            onLinkTap: null,
            style: <String, Style>{'test': Style()},
            shrinkWrap: false,
            key: null,
            onMathError:
                (String parsedTex, String exception, String exceptionWithType) {
              return Text(exception);
            },
            tagsList: const <String>[],
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
