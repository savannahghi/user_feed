// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_ui_components/small_appbar.dart';

// Project imports:
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/strings.dart';
import 'package:user_feed/src/domain/value_objects/widget_keys.dart';
import 'image_viewer.dart';

class FeedItemImageGrid extends StatelessWidget {
  const FeedItemImageGrid({Key? key, required this.images}) : super(key: key);

  final List<Link?>? images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: feedImageGridPageKey,
      appBar: const SILSmallAppBar(title: pageTitleForImages),
      body: Scrollbar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              if (images == null || images!.isEmpty)
                Container()
              else
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: StaggeredGridView.countBuilder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    itemCount: images!.length,
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.count(2, index.isEven ? 2 : 1),
                    itemBuilder: (BuildContext context, int index) {
                      final String imageUrl = images![index]!.url!;
                      return GestureDetector(
                        key: Key(images![index]!.url!),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<FeedImageViewer>(
                              builder: (_) => FeedImageViewer(
                                imageUrl: images![index]!.url,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(imageUrl),
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius:
                                    0.3, // shadow direction: bottom right
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
