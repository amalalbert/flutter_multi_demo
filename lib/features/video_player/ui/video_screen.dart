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
    final playlist = use(videoPlaylistCapsule);
    final (activeIndex, setActiveIndex) = use(activeVideoIndexCapsule);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('BetterPlayer Playlist')),
      body: Column(
        children: [
          // Player Section
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              color: Colors.black,
              child: switch (playerAsync) {
                AsyncData(data: final controller) => BetterPlayer(controller: controller),
                AsyncLoading() => const Center(child: CircularProgressIndicator()),
                AsyncError(error: final err) => Center(
                    child: Text('Error: $err', style: const TextStyle(color: Colors.red)),
                  ),
                _ => const SizedBox.shrink(),
              },
            ),
          ),

          // Playlist Section
          Expanded(
            child: ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                final isSelected = activeIndex == index;
                return ListTile(
                  tileColor: isSelected ? Colors.white10 : Colors.transparent,
                  leading: Icon(
                    isSelected ? Icons.play_arrow : Icons.video_library,
                    color: isSelected ? Colors.blue : Colors.white54,
                  ),
                  title: Text(
                    'Video ${index + 1}',
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.white,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  subtitle: Text(playlist[index], 
                    maxLines: 1, 
                    style: const TextStyle(color: Colors.white38, fontSize: 10)),
                  onTap: () => setActiveIndex(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}