import 'package:flutter/material.dart';
import 'package:flutter_hls_video_player/flutter_hls_video_player/controller/flutter_hls_video_controls.dart';
import 'package:flutter_hls_video_player/flutter_hls_video_player/controller/flutter_hls_video_player_controller.dart';
import 'package:flutter_hls_video_player/flutter_hls_video_player/controller/flutter_hls_video_player_state.dart';
import 'package:flutter_hls_video_player/flutter_hls_video_player/view/flutter_hls_video_player.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/video_player/data/video_repository.dart';

class HomeView extends RearchConsumer {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final playlist = use(videoPlaylistCapsule);
    final (activeIndex, setActiveIndex) = use(activeVideoIndexCapsule);
    final controller = use(hlsControllerCapsule);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: StreamBuilder<FlutterHLSVideoPlayerState>(
          stream: controller.stateStream,
          builder: (context, snapshot) {
            final isFullScreen = snapshot.data?.fullScreen ?? false;

            return Stack(
              children: [
                if (!isFullScreen)
                  Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(color: Colors.black),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: playlist.length,
                          itemBuilder: (context, index) => ListTile(
                            onTap: () => setActiveIndex(index),
                            title: Text(
                              playlist[index],
                              style: TextStyle(
                                color: activeIndex == index 
                                    ? Theme.of(context).primaryColor 
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                
                // The actual Player Widget
                FlutterHLSVideoPlayer(
                  controller: controller,
                  controls: FlutterHLSVideoPlayerControls(
                    hideBackArrowWidget: true,
                    onTapSetting: () => _showQualityMenu(context, controller),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showQualityMenu(BuildContext context, FlutterHLSVideoPlayerController controller) {
    final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final videoState = controller.initialState; // Or get from the Stream snapshot

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(overlay.size.width - 50, 100, 10, 0),
      items: [
        PopupMenuItem(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: (videoState.availableQualities ?? []).asMap().entries.map((entry) {
              int index = entry.key;
              var quality = entry.value;
              String height = quality['height'].toString();
              
              return ListTile(
                selected: videoState.currentQuality == index,
                title: Text(height == "Auto" ? height : "${height}P"),
                onTap: () {
                  controller.changeQuality(index == 0 ? -1 : index);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}