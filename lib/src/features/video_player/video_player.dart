import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/src/constants/constants.dart';
import 'package:sil_feed/src/shared/utils/widget_keys.dart';

import 'package:sil_misc/sil_misc.dart';
import 'package:sil_themes/spaces.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates [VideoPlayerWidget] widget.
/// Creates and embedded video of a mini youtube player
/// Constrain it using a container in a page the player does not span the whole screen
class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, required this.videos}) : super(key: key);

  final List<dynamic> videos;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _videoController;

  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String?> _videoIds = <String>[];

  void getVideoID() {
    widget.videos
        .map((dynamic video) => this
            ._videoIds
            .add(YoutubePlayer.convertUrlToId(video['url'] as String)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    getVideoID();
    _videoController = YoutubePlayerController(
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
    return widget.videos.isEmpty
        ? Container()
        : VisibilityDetector(
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
                      (_videoIds.indexOf(data.videoId) + 1) %
                          _videoIds.length]!);
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackbar(
                        content: 'Playing your next video...',
                        durationSeconds: kShortSnackbarDuration,
                        label: ''));
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.skip_previous),
                              onPressed: _isPlayerReady
                                  ? () => _videoController.load(_videoIds[
                                      (_videoIds.indexOf(_videoController
                                                  .metadata.videoId) -
                                              1) %
                                          _videoIds.length]!)
                                  : null,
                            ),
                            IconButton(
                              icon: Icon(
                                _videoController.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: _isPlayerReady
                                  ? () {
                                      _videoController.value.isPlaying
                                          ? _videoController.pause()
                                          : _videoController.play();
                                      setState(() {});
                                    }
                                  : null,
                            ),
                            IconButton(
                              icon: Icon(
                                  _muted ? Icons.volume_off : Icons.volume_up),
                              onPressed: _isPlayerReady
                                  ? () {
                                      _muted
                                          ? _videoController.unMute()
                                          : _videoController.mute();
                                      setState(() {
                                        _muted = !_muted;
                                      });
                                    }
                                  : null,
                            ),
                            IconButton(
                              icon: const Icon(Icons.skip_next),
                              onPressed: _isPlayerReady
                                  ? () => _videoController.load(_videoIds[
                                      (_videoIds.indexOf(_videoController
                                                  .metadata.videoId) +
                                              1) %
                                          _videoIds.length]!)
                                  : null,
                            ),
                          ],
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

  Widget get _space => const SizedBox(height: 10);
}
