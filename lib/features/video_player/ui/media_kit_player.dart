
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MediaKitPlayer extends StatefulWidget {
  const MediaKitPlayer({super.key});

  @override
  State<MediaKitPlayer> createState() => MediaKitPlayerState();
}

class MediaKitPlayerState extends State<MediaKitPlayer> {
  late final String videoUrl;
  late final player = Player();
  late final controller = VideoController(player);


  @override
  void initState() {
    super.initState();
    videoUrl = "https://demo.unified-streaming.com/k8s/features/stable/video/tears-of-steel/tears-of-steel.ism/.m3u8";
    player.open(Media(videoUrl));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: Video(controller: controller),
      ),
    );
  }
}