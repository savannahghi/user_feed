import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:user_feed/src/domain/entities/link.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    required this.videos,
    this.autoPlay = false,
    this.chewieController,
  }) : super(key: key);

  final bool autoPlay;
  final Future<ChewieController?>? chewieController;
  final List<Link?>? videos;

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChewieController?>(
      future: widget.chewieController,
      builder:
          (BuildContext context, AsyncSnapshot<ChewieController?> snapshot) {
        if (!snapshot.hasData ||
            !snapshot.data!.videoPlayerController.value.isInitialized) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.network(widget.videos!.first!.thumbnail!),
              const CircularProgressIndicator(color: Colors.white),
            ],
          );
        }
        return Chewie(controller: snapshot.data!);
      },
    );
  }
}
