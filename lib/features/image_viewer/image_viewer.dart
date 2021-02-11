import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:sil_feed/shared/widgets/constants.dart';
import 'package:sil_feed/shared/widgets/sil_small_appbar.dart';

class FeedImageViewer extends StatelessWidget {
  final String imageUrl;

  const FeedImageViewer({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SILSmallAppBar(title: imageString),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child: PhotoView(
            imageProvider: NetworkImage(imageUrl ?? fallbackUrl),
            backgroundDecoration: BoxDecoration(color: Colors.white),
            enableRotation: false,
            initialScale: PhotoViewComputedScale.contained,
            basePosition: Alignment.center,
          ),
        ),
      ),
    );
  }
}
