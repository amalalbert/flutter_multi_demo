
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/video_player/data/video_repository.dart';

class VideoStreamPage extends RearchConsumer {
  const VideoStreamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final playerAsync = use(betterPlayerStateCapsule);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('BetterPlayer HLS'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: switch (playerAsync) {
          // Success: Display the player
          AsyncData(data: final controller) => AspectRatio(
              aspectRatio: 16 / 9,
              child: BetterPlayer(controller: controller),
            ),
          
          // Loading: Prevents ANR while the M3U8 manifest is being parsed
          AsyncLoading() => const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.blue),
                SizedBox(height: 16),
                Text('Buffering Stream...', style: TextStyle(color: Colors.white)),
              ],
            ),

          // Error: Handles network or decoder failures
          AsyncError(error: final err) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Player Error: $err',
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          // TODO: Handle this case.
          Object() => throw UnimplementedError(),
          // TODO: Handle this case.
          null => throw UnimplementedError(),
        },
      ),
    );
  }
}