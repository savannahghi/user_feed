import 'package:flutter/material.dart';
import 'package:sil_feed/shared/widgets/constants.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:sil_feed/shared/widgets/sil_small_appbar.dart';

class FeedDocumentViewer extends StatelessWidget {
  final String documentURL;
  final String flavour;
  final String documentTitle;

  const FeedDocumentViewer(
      {@required this.documentURL, this.flavour, this.documentTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SILSmallAppBar(title: documentTitle),
      body: Container(
        color: Colors.white,
        child: PDF.network(
          documentURL ?? fallbackPdfUrl,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          placeHolder: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
      ),
    );
  }
}
