import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/shared/utils/colors.dart';
import 'package:sil_feed/shared/utils/text_themes.dart';
import 'package:sil_feed/shared/utils/widget_keys.dart';
import 'package:sil_feed/constants/constants.dart';
import 'package:sil_feed/shared/widgets/sil_small_appbar.dart';
import 'package:sil_feed/shared/widgets/strings.dart';
import 'package:sil_themes/spaces.dart';

import 'feed_document_viewer.dart';

class FeedItemDocumentGrid extends StatelessWidget {
  final List<dynamic> documents;
  final String flavour;

  const FeedItemDocumentGrid({Key key, @required this.documents, this.flavour})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: feedDocumentsListPageKey,
      backgroundColor: backgroundColor,
      appBar: SILSmallAppBar(title: FeedDocumentListStrings.pageTitle),
      body: Scrollbar(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            documents.isEmpty
                ? Container()
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: documents.length,
                      itemBuilder: (BuildContext context, int index) {
                        // extract the pdf url and name if any
                        // final Map<String, dynamic> pdfDocumentObject =
                        //     documents[index];

                        final String documentThumbnail =
                            documents[index]['thumbnail'];

                        final String documentTitle = documents[index]['title'];
                        final String documentURL = documents[index]['url'];
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: GestureDetector(
                                key: Key(documentTitle),
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute<FeedDocumentViewer>(
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
                                        margin: EdgeInsets.all(8),
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  child: Text(
                                                    documentTitle ??
                                                        FeedDocumentListStrings
                                                            .fallbackDocumentTitle,
                                                    style: TextThemes
                                                        .boldSize16Text(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
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
