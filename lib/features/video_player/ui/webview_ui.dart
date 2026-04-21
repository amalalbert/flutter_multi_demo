import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreamingWebViewPage extends StatefulWidget {
  const StreamingWebViewPage({super.key});

  @override
  State<StreamingWebViewPage> createState() => _StreamingWebViewPageState();
}

class _StreamingWebViewPageState extends State<StreamingWebViewPage> {
  late final WebViewController _controller;
  bool isLoading = true;

  final String url =
      "https://player.mediadelivery.net/embed/632074/0ab39215-2445-4175-a074-9c3f8275478f?autoplay=true&loop=false&muted=false&preload=true&responsive=true";

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        "Mozilla/5.0 (Linux; Android 10; Mobile) AppleWebKit/537.36 Chrome/100 Safari/537.36",
      )
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (url) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(url),
       headers: {
      "Referer": "https://yourdomain.com",
    },);
     
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Video Player"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),

          // 🔄 Loading indicator
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}