import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:user_feed/src/domain/value_objects/colors.dart';
import 'package:user_feed/src/domain/value_objects/enums.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'package:user_feed/src/presentation/widgets/feed_zero_state.dart';

import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';
import 'package:shared_ui_components/small_appbar.dart';

import 'feed_document_viewer.dart';

class FeedItemDocumentGrid extends StatelessWidget {
  const FeedItemDocumentGrid({Key? key, required this.documents, this.flavour})
      : super(key: key);

  final List<Link> documents;
  final Flavour? flavour;

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
              const FeedZeroState(
                key: feedDocumentsListEmptyContainerKey,
                subtitle: noDocumentFound,
              )
            else
              Container(
                key: feedDocumentsListContainerKey,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String? documentThumbnail =
                        documents[index].thumbnail;

                    final String documentTitle = documents[index].title!;
                    final String documentURL = documents[index].url!;
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            key: Key(documentTitle),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute<FeedDocumentViewer>(
                                  builder: (_) => FeedDocumentViewer(
                                      documentURL: documentURL,
                                      flavour: flavour,
                                      documentTitle: documentTitle),
                                ),
                              );
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
