import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/posts/ui/post_screen.dart';
import 'package:rearch_demo/features/products/ui/product_list_screen.dart';
import 'package:rearch_demo/features/video_player/ui/bitmovin_player.dart';
import 'package:rearch_demo/features/video_player/ui/media_kit_player.dart';
import 'package:rearch_demo/features/video_player/ui/video_screen.dart';
import 'package:rearch_demo/features/video_player/ui/webview_ui.dart';
import 'package:rearch_demo/logic/nav_capsules.dart';
// Import your previous capsules and models here

class MainHomeScreen extends RearchConsumer {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // Access navigation state
    final (currentIndex, setIndex) = use(navIndexCapsule);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          PostScreen(), // Page 1: JSONPlaceholder API
          ProductListScreen(), // Page 2: DummyJSON API
          VideoStreamPage(),
          // StreamingWebViewPage(),
          // MediaKitPlayer(),
          // BasicPlayback()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.black, // or your theme
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Color.fromARGB(255, 19, 19, 19)),
        onTap: setIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Posts'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Live'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'WebLive'),
          // BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'MediaKit'),
          // BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Bitmovin'),
        ],
      ),
    );
  }
}