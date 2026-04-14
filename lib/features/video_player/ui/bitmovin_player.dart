
import 'package:bitmovin_player/bitmovin_player.dart';
import 'package:flutter/material.dart';

class BasicPlayback extends StatefulWidget {
  const BasicPlayback({super.key});

  @override
  State<BasicPlayback> createState() => _BasicPlaybackState();
}

class _BasicPlaybackState extends State<BasicPlayback> {
  final _sourceConfig = const SourceConfig(
    url: "https://media.axprod.net/TestVectors/v6.1-MultiDRM-MultiKey/Manifest_1080p.mpd",
    type: SourceType.dash,
    title: 'Tears of Steel',
    drmConfig: DrmConfig(
      widevine: WidevineConfig(
        licenseUrl:
            "https://drm-widevine-licensing.axtest.net/AcquireLicense",
      ),
    ),
    analyticsSourceMetadata: SourceMetadata(
      videoId: 'flutter-wizard-Tears_of_Steel-1775649959798',
      title: 'Tears of Steel',
      isLive: false,
    ),
  );
  final _player = Player(
    config: const PlayerConfig(
      // Bitmovin player license key
      key: '060527b2-9b9c-4a42-80b5-6f56e7790afb',
      analyticsConfig: AnalyticsConfig(
        // Bitmovin Observability key from the Observability Dashboard
        licenseKey: 'a6e47b9d-123c-4728-882a-8a933737acc4',
      ),
    ),
  );

  @override
  void initState() {
    _player.loadSourceConfig(_sourceConfig);
    super.initState();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Playback'),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: PlayerView(
              player: _player,
            ),
          ),
        ],
      ),
    );
  }
}  