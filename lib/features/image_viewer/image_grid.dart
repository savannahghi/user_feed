import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sil_feed/shared/utils/widget_keys.dart';
import 'package:sil_feed/shared/widgets/sil_small_appbar.dart';
import 'package:sil_feed/shared/widgets/strings.dart';

import 'image_viewer.dart';

class FeedItemImageGrid extends StatelessWidget {
  final List<dynamic> images;
  final String flavour;

  const FeedItemImageGrid(
      {Key key, @required this.images, @required this.flavour})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: feedImageGridPageKey,
      appBar: SILSmallAppBar(title: FeedImageGridStrings.pageTitle),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              images.isEmpty
                  ? Container()
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: StaggeredGridView.countBuilder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        itemCount: images.length,
                        staggeredTileBuilder: (int index) =>
                            StaggeredTile.count(2, index.isEven ? 2 : 1),
                        itemBuilder: (BuildContext context, int index) {
                          final String imageUrl = images[index]['url'];
                          return GestureDetector(
                            key: Key(images[index]['url']),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute<FeedImageViewer>(
                                builder: (_) => FeedImageViewer(
                                  imageUrl: images[index]['url'],
                                ),
                              ));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                    image: NetworkImage(imageUrl)),
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 0.3,
                                    spreadRadius: 0.0,
                                    offset: Offset(0.0,
                                        0.0), // shadow direction: bottom right
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
