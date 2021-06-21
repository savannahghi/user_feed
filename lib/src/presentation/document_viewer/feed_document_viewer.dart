import 'package:flutter/material.dart';
import 'package:sil_pdf_flutter/sil_pdf_flutter.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:shared_ui_components/small_appbar.dart';

class FeedDocumentViewer extends StatelessWidget {
  const FeedDocumentViewer(
      {required this.documentURL, this.flavour, required this.documentTitle});

  final String documentURL;
  final Flavour? flavour;
  final String documentTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SILSmallAppBar(title: documentTitle),
      body: Container(
        color: Colors.white,
        child: InteractiveViewer(
          child: PDF.network(
            documentURL,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            placeHolder: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
      ),
    );
  }
}
