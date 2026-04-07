import 'package:flutter_hls_video_player/flutter_hls_video_player/controller/flutter_hls_video_player_controller.dart';
import 'package:rearch/rearch.dart';

// 1. The Playlist Data
List<String> videoPlaylistCapsule(CapsuleHandle use) => [
  "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
  "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
  "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8",
  "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",
  "https://moctobpltc-i.akamaihd.net/hls/live/571329/eight/playlist.m3u8",
  "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8",
];

// 2. Active Video Index State
(int, void Function(int)) activeVideoIndexCapsule(CapsuleHandle use) {
  return use.state(0); // Default to the first video
}

// 3. The Controller Capsule (Handles the actual Player logic)
FlutterHLSVideoPlayerController hlsControllerCapsule(CapsuleHandle use) {
  final playlist = use(videoPlaylistCapsule);
  final (index, _) = use(activeVideoIndexCapsule);

  // Memoize the controller so it persists
  var controller = use.memo(() => FlutterHLSVideoPlayerController());

  // side effect to load video whenever the index changes
  // Separate Effect for Disposal:
  // This runs ONLY when the app/feature is destroyed.
  use.effect(() {
    return () => controller.dispose();
  }, [controller]); // Only disposes when the controller object itself changes

  // 3. Separate Effect for Loading:
  // This runs whenever the index changes.
  use.effect(() {
    // Check if the controller is already closed to avoid the StateError
    // Note: If the package doesn't expose an 'isClosed' property,
    // ReArch's use.effect handles the sync nature naturally.

    controller.loadHlsVideo(playlist[index]);
    controller.play();

    return null; // No disposal here! We don't want to close it between videos.
  }, [index]);

  return controller;
}
