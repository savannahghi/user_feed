import 'package:chewie/chewie.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/domain/value_objects/constants.dart';
import 'package:video_player/video_player.dart';

class ChewieUtils {
  Future<ChewieController?> chewieController({
    List<Link?>? videos,
    bool? autoPlay = false,
    VideoPlayerController? videoPlayerController,
  }) async {
    if (videoPlayerController != null) {
      return ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: autoPlay!,
      );
    } else {
      return ChewieController(
        videoPlayerController: VideoPlayerController.network(
          videos!.first!.url != null
              ? videos.first!.url!
              : defaultInitialFeedMp4Video,
        ),
        autoPlay: autoPlay!,
      );
    }
  }
}
