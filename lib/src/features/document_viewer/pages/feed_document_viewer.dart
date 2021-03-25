import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:sil_misc/sil_small_app_bar.dart';

class FeedDocumentViewer extends StatelessWidget {
  const FeedDocumentViewer(
      {required this.documentURL, this.flavour, required this.documentTitle});

  final String documentURL;
  final String? flavour;
  final String documentTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SILSmallAppBar(title: documentTitle),
      body: Container(
        color: Colors.white,
        child: PDF.network(
          documentURL,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          placeHolder: const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
