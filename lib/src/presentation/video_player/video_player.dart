import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/src/domain/entities/link.dart';
import 'package:sil_feed/src/domain/value_objects/constants.dart';
import 'package:sil_feed/src/application/helpers/utils.dart';
import 'package:sil_feed/src/domain/value_objects/widget_keys.dart';

import 'package:sil_themes/spaces.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates [VideoPlayerWidget] widget.
/// Creates and embedded video of a mini youtube player
/// Constrain it using a container in a page the player does not span the whole screen
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.videos, this.videoController})
      : super(key: key);

  final List<Link> videos;
  final YoutubePlayerController? videoController;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _videoController;

  bool _isPlayerReady = false;

  final List<String?> _videoIds = <String>[];

  void getVideoID() {
    if (widget.videos.isEmpty) {
      return this._videoIds.add(defaultInitialFeedVideoUrl);
    }

    widget.videos
        .map((Link video) =>
            this._videoIds.add(YoutubePlayer.convertUrlToId(video.url!)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    getVideoID();

    _videoController = widget.videoController ??
        YoutubePlayerController(
          initialVideoId: _videoIds.first ?? defaultInitialFeedVideoUrl,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
          ),
        );
    _videoController.addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_videoController.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _videoController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videos.isEmpty) {
      return const SizedBox();
    } else {
      return VisibilityDetector(
        onVisibilityChanged: (VisibilityInfo info) {
          /// only pause the video when the widget's visibility is hidden
          ///
          /// this can happen when the user navigates to a new screen or
          /// when a modal is shown (yet to be confirmed)
          if (info.visibleFraction == 0) {
            _videoController.pause();
          }
        },
        key: videoPlayerVisibilityDetectorKey,
        child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _videoController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Theme.of(context).primaryColor,
            topActions: <Widget>[
              smallHorizontalSizedBox,
              Expanded(
                child: Text(
                  _videoController.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
            onReady: () {
              setState(() {
                _isPlayerReady = true;
              });
            },
            onEnded: (YoutubeMetaData data) {
              _videoController.load(_videoIds[
                  (_videoIds.indexOf(data.videoId) + 1) % _videoIds.length]!);
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  snackbar(
                      content: 'Playing your next video...',
                      durationSeconds: kShortSnackbarDuration,
                      label: ''),
                );
            },
          ),
          builder: (BuildContext context, Widget player) => ListView(
            shrinkWrap: true,
            children: <Widget>[
              player,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _space,
                    VideoControllers(
                      videoController: _videoController,
                      videoIds: _videoIds,
                      isPlayerReady: _isPlayerReady,
                    ),
                    _space,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget get _space => const SizedBox(height: 10);
}

class VideoControllers extends StatefulWidget {
  const VideoControllers({
    Key? key,
    required this.videoController,
    required this.isPlayerReady,
    required this.videoIds,
  }) : super(key: key);
  final YoutubePlayerController videoController;

  final bool isPlayerReady;
  final List<String?> videoIds;

  @override
  _VideoControllersState createState() => _VideoControllersState();
}

class _VideoControllersState extends State<VideoControllers> {
  bool _muted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          key: videoPreviousKey,
          icon: const Icon(Icons.skip_previous),
          onPressed: widget.isPlayerReady
              ? () => widget.videoController.load(widget.videoIds[(widget
                          .videoIds
                          .indexOf(widget.videoController.metadata.videoId) -
                      1) %
                  widget.videoIds.length]!)
              : null,
        ),
        IconButton(
          key: videoPlayPauseKey,
          icon: Icon(
            widget.videoController.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
          onPressed: widget.isPlayerReady
              ? () {
                  widget.videoController.value.isPlaying
                      ? widget.videoController.pause()
                      : widget.videoController.play();
                  setState(() {});
                }
              : null,
        ),
        IconButton(
          key: videoVolumeKey,
          icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
          onPressed: widget.isPlayerReady
              ? () {
                  _muted
                      ? widget.videoController.unMute()
                      : widget.videoController.mute();
                  setState(() {
                    _muted = !_muted;
                  });
                }
              : null,
        ),
        IconButton(
          icon: const Icon(Icons.skip_next),
          key: videoNextKey,
          onPressed: widget.isPlayerReady
              ? () => widget.videoController.load(widget.videoIds[(widget
                          .videoIds
                          .indexOf(widget.videoController.metadata.videoId) +
                      1) %
                  widget.videoIds.length]!)
              : null,
        ),
      ],
    );
  }
}
