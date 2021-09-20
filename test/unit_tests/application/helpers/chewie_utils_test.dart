import 'package:chewie/chewie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/application/helpers/chewie_utils.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:video_player/video_player.dart';

void main() {
  test(
    'should return a correct video player instance',
    () async {
      final List<Link> videos = <Link>[
        Link(
          title: 'Some title',
          description: 'Some description',
        ),
      ];

      final VideoPlayerController _controller =
          VideoPlayerController.network('');

      // call
      final ChewieUtils _chewieUtils = ChewieUtils();

      final ChewieController? _controllerResult =
          await _chewieUtils.chewieController(
        videos: videos,
        videoPlayerController: _controller,
      );

      expect(_controllerResult!.autoPlay, false);
      expect(_controllerResult, isA<ChewieController>());
      expect(_controllerResult.videoPlayerController, _controller);
    },
  );
}
