import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:shared_ui_components/small_appbar.dart';

class FeedImageViewer extends StatelessWidget {
  const FeedImageViewer({Key? key, this.imageUrl}) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SILSmallAppBar(title: imageString),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Center(
          child: InteractiveViewer(
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl ?? fallbackUrl),
              backgroundDecoration: const BoxDecoration(color: Colors.white),
              initialScale: PhotoViewComputedScale.contained,
              basePosition: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
