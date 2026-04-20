import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/features/home/ui/auto_banner_slider.dart';
import 'package:rearch_demo/features/home/ui/hero_section.dart';
import 'package:rearch_demo/features/home/ui/title_bar.dart';
// Import your previous capsules and models here

class MainHomeScreen extends RearchConsumer {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    // Access navigation state

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeroBanner(),
              SizedBox(height: 16),
              AutoBannerSlider(),
            ],
          ),
        ),
      ),
      appBar: const TitleBar(),
    );
  }
}
