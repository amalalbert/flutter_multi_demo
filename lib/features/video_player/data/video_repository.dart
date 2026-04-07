import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

// Capsule to manage the BetterPlayerController
AsyncValue<BetterPlayerController> betterPlayerStateCapsule(CapsuleHandle use) {
  // Use a trigger if you want to allow external refreshes
  final (index, _) = use.state(0); 
  final playlist = [
    "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.mp4/.m3u8",
    "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",
  ];

  final initFuture = use.memo(() async {
    // 1. Define Configuration
    final controller = BetterPlayerController(
      const BetterPlayerConfiguration(
        autoPlay: true,
        looping: false,
        aspectRatio: 16 / 9,
        subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
          fontSize: 20,
          fontColor: Colors.white,
        ),
        controlsConfiguration: BetterPlayerControlsConfiguration(
          enablePlayPause: true,
          enableMute: true,
          enableFullscreen: true,
          enableSubtitles: true,
        ),
      ),
    );

    // 2. Define Data Source
    final dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      playlist[index],
      headers: {"Custom-Header": "value"},
      useAsmsTracks: true,
      cacheConfiguration: const BetterPlayerCacheConfiguration(
        maxCacheSize: 100 * 1024 * 1024,
      ),
      notificationConfiguration: const BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: "Tears of Steel",
      ),
    );

    // 3. Setup and wait
    await controller.setupDataSource(dataSource);
    return controller;
  }, [index]); // Re-initialize if the index changes

  // Automatic Disposal
  use.effect(() {
    return () async {
      final controller = await initFuture;
      controller.dispose();
    };
  }, [initFuture]);

  return use.future(initFuture);
}