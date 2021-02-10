import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sil_feed/shared/utils/sizing.dart';
import 'package:sil_feed/shared/utils/utils.dart';
import 'package:sil_feed/shared/widgets/constants.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Creates [VideoPlayerWidget] widget.
/// Creates and embedded video of a mini youtube player
/// Constrain it using a container in a page the player does not span the whole screen
class VideoPlayer extends StatefulWidget {
  final List<dynamic> videos;

  const VideoPlayer({Key key, @required this.videos}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  YoutubePlayerController _controller;
  TextEditingController _idController;
  TextEditingController _seekToController;

  bool _muted = false;
  bool _isPlayerReady = false;

  List<String> _ids = <String>[];

  void getVideoID() {
    List<String> videoIds = <String>[];
    widget.videos
        .map((dynamic video) =>
            videoIds.add(YoutubePlayer.convertUrlToId(video['url'])))
        .toList();
    _ids = videoIds;

    // check for nulls
  }

  @override
  void initState() {
    super.initState();
    getVideoID();
    _controller = YoutubePlayerController(
      initialVideoId: _ids?.first ?? 'gcv2Z2AdpjM',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    // _videoMetaData = const YoutubeMetaData();
    // _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.videos.isEmpty
        ? Container()
        : YoutubePlayerBuilder(
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                smallHorizontalSizedBox,
                Expanded(
                  child: Text(
                    _controller.metadata.title,
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
                _isPlayerReady = true;
              },
              onEnded: (YoutubeMetaData data) {
                _controller
                    .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                Scaffold.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(FeedUtils.snackbar(
                      content: 'Next video started!',
                      durationSeconds: kShortSnackbarDuration));
              },
            ),
            builder: (BuildContext context, Widget player) => Scaffold(
              body: ListView(
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
                                  ? () => _controller.load(_ids[(_ids.indexOf(
                                              _controller.metadata.videoId) -
                                          1) %
                                      _ids.length])
                                  : null,
                            ),
                            IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: _isPlayerReady
                                  ? () {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
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
                                          ? _controller.unMute()
                                          : _controller.mute();
                                      setState(() {
                                        _muted = !_muted;
                                      });
                                    }
                                  : null,
                            ),
                            IconButton(
                              icon: const Icon(Icons.skip_next),
                              onPressed: _isPlayerReady
                                  ? () => _controller.load(_ids[(_ids.indexOf(
                                              _controller.metadata.videoId) +
                                          1) %
                                      _ids.length])
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
