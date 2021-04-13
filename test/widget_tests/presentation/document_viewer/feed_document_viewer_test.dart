import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:sil_feed/src/presentation/document_viewer/feed_document_viewer.dart';
import 'package:sil_ui_components/sil_small_appbar.dart';

void main() {
  testWidgets('should tets document_viewer_test.dart renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: FeedDocumentViewer(
      documentTitle: 'Document Title',
      documentURL:
          'https://raw.githubusercontent.com/FlutterInThai/Dart-for-Flutter-Sheet-cheet/master/Dart-for-Flutter-Cheat-Sheet.pdf',
    )));

    expect(find.byType(SILSmallAppBar), findsOneWidget);
    expect(find.byType(PDF), findsOneWidget);
  });
}