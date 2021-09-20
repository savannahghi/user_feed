import 'dart:async';
import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/application/helpers/chewie_utils.dart';
import 'package:user_feed/src/domain/entities/link.dart';
import 'package:user_feed/src/presentation/video_player/custom_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_platform_interface/messages.dart';
import 'package:video_player_platform_interface/test.dart';
import '../../../mock_data.dart';
import '../../../mock_utils.dart';
import '../../../test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final ChewieUtils chewieUtils = ChewieUtils();
  setUp(() {
    HttpOverrides.global = TestHttpOverrides();
  });

  testWidgets('CustomVideoPlayer Renders correctly',
      (WidgetTester tester) async {
    final FakeController _controller = FakeController();

    final ChewieController? _chewieController =
        await chewieUtils.chewieController(
      videos: <Link>[mockMP4VideoLink],
      videoPlayerController: _controller,
      autoPlay: true,
    );
    await buildTestWidget(
        tester: tester,
        child: CustomVideoPlayer(
          videos: <Link>[mockMP4VideoLink],
          chewieController: Future<ChewieController>.value(
            _chewieController,
          ),
        ));

    _controller.value = _controller.value.copyWith(
        isInitialized: true, duration: Duration.zero, isPlaying: true);
    await tester.pump();

    await tester.pump(const Duration(minutes: 2));

    expect(find.byType(CustomVideoPlayer), findsOneWidget);
    await tester.tap(find.byType(CustomVideoPlayer));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('CustomVideoPlayer should show loading state',
      (WidgetTester tester) async {
    final FakeController _controller = FakeController();

    _controller.value = _controller.value.copyWith(isInitialized: false);
    await buildTestWidget(
        tester: tester,
        child: CustomVideoPlayer(
          videos: <Link>[mockMP4VideoLink],
        ));

    _controller.value = _controller.value
        .copyWith(isInitialized: true, duration: Duration.zero);
    await tester.pump();

    await tester.pump(const Duration(minutes: 2));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

class FakeController extends ValueNotifier<VideoPlayerValue>
    implements VideoPlayerController {
  FakeController() : super(VideoPlayerValue(duration: Duration.zero));

  @override
  Future<void> dispose() async {
    super.dispose();
  }

  @override
  int textureId = VideoPlayerController.kUninitializedTextureId;

  @override
  String get dataSource => '';

  @override
  Map<String, String> get httpHeaders => <String, String>{};

  @override
  DataSourceType get dataSourceType => DataSourceType.file;

  @override
  String get package => '';

  @override
  Future<Duration> get position async => value.position;

  @override
  Future<void> seekTo(Duration moment) async {}

  @override
  Future<void> setVolume(double volume) async {}

  @override
  Future<void> setPlaybackSpeed(double speed) async {}

  @override
  Future<void> initialize() async {}

  @override
  Future<void> pause() async {}

  @override
  Future<void> play() async {}

  @override
  Future<void> setLooping(bool looping) async {}

  @override
  VideoFormat? get formatHint => null;

  @override
  Future<ClosedCaptionFile> get closedCaptionFile => _loadClosedCaption();

  @override
  VideoPlayerOptions? get videoPlayerOptions => null;
}

Future<ClosedCaptionFile> _loadClosedCaption() async =>
    _FakeClosedCaptionFile();

class _FakeClosedCaptionFile extends ClosedCaptionFile {
  @override
  List<Caption> get captions {
    return <Caption>[
      const Caption(
        text: 'one',
        number: 0,
        start: Duration(milliseconds: 100),
        end: Duration(milliseconds: 200),
      ),
      const Caption(
        text: 'two',
        number: 1,
        start: Duration(milliseconds: 300),
        end: Duration(milliseconds: 400),
      ),
    ];
  }
}

class FakeVideoPlayerPlatform extends TestHostVideoPlayerApi {
  FakeVideoPlayerPlatform() {
    TestHostVideoPlayerApi.setup(this);
  }

  Completer<bool> initialized = Completer<bool>();
  List<String> calls = <String>[];
  List<CreateMessage> dataSourceDescriptions = <CreateMessage>[];
  final Map<int, FakeVideoEventStream> streams = <int, FakeVideoEventStream>{};
  bool forceInitError = false;
  int nextTextureId = 0;
  final Map<int, Duration> _positions = <int, Duration>{};

  @override
  TextureMessage create(CreateMessage arg) {
    calls.add('create');
    streams[nextTextureId] = FakeVideoEventStream(
      nextTextureId,
      100,
      100,
      const Duration(seconds: 1),
      initWithError: forceInitError,
    );
    final TextureMessage result = TextureMessage();
    result.textureId = nextTextureId++;
    dataSourceDescriptions.add(arg);
    return result;
  }

  @override
  void dispose(TextureMessage arg) {
    calls.add('dispose');
  }

  @override
  void initialize() {
    calls.add('init');
    initialized.complete(true);
  }

  @override
  void pause(TextureMessage arg) {
    calls.add('pause');
  }

  @override
  void play(TextureMessage arg) {
    calls.add('play');
  }

  @override
  PositionMessage position(TextureMessage arg) {
    calls.add('position');
    final Duration position = _positions[arg.textureId] ?? Duration.zero;
    return PositionMessage()..position = position.inMilliseconds;
  }

  @override
  void seekTo(PositionMessage arg) {
    calls.add('seekTo');
    _positions[arg.textureId!] = Duration(milliseconds: arg.position!);
  }

  @override
  void setLooping(LoopingMessage arg) {
    calls.add('setLooping');
  }

  @override
  void setVolume(VolumeMessage arg) {
    calls.add('setVolume');
  }

  @override
  void setPlaybackSpeed(PlaybackSpeedMessage arg) {
    calls.add('setPlaybackSpeed');
  }

  @override
  void setMixWithOthers(MixWithOthersMessage arg) {
    calls.add('setMixWithOthers');
  }
}

class FakeVideoEventStream {
  FakeVideoEventStream(this.textureId, this.width, this.height, this.duration,
      {required this.initWithError}) {
    eventsChannel = FakeEventsChannel(
        'flutter.io/videoPlayer/videoEvents$textureId', onListen);
  }

  int textureId;
  int width;
  int height;
  Duration duration;
  bool initWithError;
  late FakeEventsChannel eventsChannel;

  void onListen() {
    if (!initWithError) {
      eventsChannel.sendEvent(<String, dynamic>{
        'event': 'initialized',
        'duration': duration.inMilliseconds,
        'width': width,
        'height': height,
      });
    } else {
      eventsChannel.sendError('VideoError', 'Video player had error XYZ');
    }
  }
}

class FakeEventsChannel {
  FakeEventsChannel(String name, this.onListen) {
    eventsMethodChannel = MethodChannel(name);
    eventsMethodChannel.setMockMethodCallHandler(onMethodCall);
  }

  late MethodChannel eventsMethodChannel;
  VoidCallback onListen;

  Future<dynamic> onMethodCall(MethodCall call) {
    switch (call.method) {
      case 'listen':
        onListen();
        break;
    }
    return Future<void>.sync(() {});
  }

  void sendEvent(dynamic event) {
    _sendMessage(const StandardMethodCodec().encodeSuccessEnvelope(event));
  }

  void sendError(String code, [String? message, dynamic details]) {
    _sendMessage(const StandardMethodCodec().encodeErrorEnvelope(
      code: code,
      message: message,
      details: details,
    ));
  }

  void _sendMessage(ByteData data) {
    _ambiguate(ServicesBinding.instance)!
        .defaultBinaryMessenger
        .handlePlatformMessage(
            eventsMethodChannel.name, data, (ByteData? data) {});
  }
}

/// This allows a value of type T or T? to be treated as a value of type T?.
///
/// We use this so that APIs that have become non-nullable can still be used
/// with `!` and `?` on the stable branch.
// TODO(ianh): Remove this once we roll stable in late 2021.
T? _ambiguate<T>(T? value) => value;
