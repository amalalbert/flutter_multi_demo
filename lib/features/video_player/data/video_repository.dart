import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

// 1. The Data Source Capsule
List<String> videoPlaylistCapsule(CapsuleHandle use) => [
  "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8",
  "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8",
  "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8",
  "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",
  "https://moctobpltc-i.akamaihd.net/hls/live/571329/eight/playlist.m3u8",
  "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8",
];

// 2. The Shared State Capsule (Shared between List and Player)
(int, void Function(int)) activeVideoIndexCapsule(CapsuleHandle use) {
  return use.state(0);
}

// 3. The Controller Capsule
AsyncValue<BetterPlayerController> betterPlayerStateCapsule(CapsuleHandle use) {
  final playlist = use(videoPlaylistCapsule);
  final (index, _) = use(activeVideoIndexCapsule);

  final initFuture = use.memo(() async {
    final controller = BetterPlayerController(
      BetterPlayerConfiguration(
        controlsConfiguration: BetterPlayerControlsConfiguration(
          overflowMenuIcon: Icons.settings, // The gear icon
          overflowModalColor:
              Colors.grey[900]!, // The background color of the popup
          overflowModalTextColor: Colors.white, // The text color
          // Customizing the items
          enableQualities: true, // Show/hide quality
          enableSubtitles: true, // Show/hide subtitles
          enablePlaybackSpeed: true, // Show/hide speed
          enableAudioTracks: true, // Show/hide audio
          // Icons inside the popup
          qualitiesIcon: Icons.hd, // HD icon for quality
          subtitlesIcon: Icons.closed_caption, // CC icon
          playbackSpeedIcon: Icons.speed, // Speed icon
          audioTracksIcon: Icons.audiotrack, // Audio icon
          controlBarColor: Colors.black.withValues(
            alpha: 0.7,
          ), // Bar background
          progressBarPlayedColor: Colors.red, // Seek bar color
          progressBarHandleColor: Colors.red, // Seek bar knob
          skipBackIcon: Icons.replay_10, // Custom back icon
          skipForwardIcon: Icons.forward_30, // Custom forward icon
          playIcon: Icons.play_arrow_rounded, // Custom play icon
          pauseIcon: Icons.pause_rounded, // Custom pause icon
          fullscreenEnableIcon: Icons.fullscreen,
          loadingColor: Colors.redAccent,
          enableSkips: true,
          enableFullscreen: true,
          enableProgressBar: true,

          // Customizing the text style for durations
          liveTextColor: Colors.red,
        ),
        autoPlay: true,
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
      ),
    );

    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      playlist[index],
      useAsmsTracks: true,
    );

    await controller.setupDataSource(dataSource);
    return controller;
  }, [index]); // Now correctly reacts to the lifted index state

  use.effect(
    () => () async {
      final controller = await initFuture;
      controller.dispose();
    },
    [initFuture],
  );

  return use.future(initFuture);
}