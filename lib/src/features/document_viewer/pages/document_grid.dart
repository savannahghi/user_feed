import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/src/constants/constants.dart';
import 'package:sil_feed/src/shared/utils/colors.dart';
import 'package:sil_feed/src/shared/utils/strings.dart';
import 'package:sil_feed/src/shared/utils/widget_keys.dart';

import 'package:sil_themes/spaces.dart';
import 'package:sil_themes/text_themes.dart';
import 'package:sil_ui_components/sil_small_appbar.dart';

import 'feed_document_viewer.dart';

class FeedItemDocumentGrid extends StatelessWidget {
  const FeedItemDocumentGrid({Key? key, required this.documents, this.flavour})
      : super(key: key);

  final List<dynamic> documents;
  final String? flavour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: feedDocumentsListPageKey,
      backgroundColor: backgroundColor,
      appBar: const SILSmallAppBar(title: pageTitleForDocuments),
      body: Scrollbar(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            if (documents.isEmpty)
              Container()
            else
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    // extract the pdf url and name if any
                    // final Map<String, dynamic> pdfDocumentObject =
                    //     documents[index];

                    final String? documentThumbnail =
                        documents[index]['thumbnail'] as String?;

                    final String documentTitle =
                        documents[index]['title'] as String;
                    final String documentURL =
                        documents[index]['url'] as String;
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            key: Key(documentTitle),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute<FeedDocumentViewer>(
                                builder: (_) => FeedDocumentViewer(
                                    documentURL: documentURL,
                                    flavour: flavour,
                                    documentTitle: documentTitle),
                              ));
                            },
                            child: Card(
                              elevation: 0,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Image.network(
                                        documentThumbnail ?? fallbackUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Row(
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              documentTitle,
                                              style:
                                                  TextThemes.boldSize16Text(),
                                              overflow: TextOverflow.ellipsis,
                                            ),

                                            verySmallVerticalSizedBox,
                                            // Container(
                                            //   child: Text(
                                            //     FeedDocumentListStrings
                                            //         .defaultDocumentInstruction,
                                            //     overflow:
                                            //         TextOverflow.ellipsis,
                                            //     style: TextThemes
                                            //         .boldSize14Text(
                                            //       Colors.grey,
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        smallVerticalSizedBox,
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
