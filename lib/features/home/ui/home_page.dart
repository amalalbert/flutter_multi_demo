import 'package:flutter/material.dart';
import 'package:rearch_demo/features/home/ui/auto_banner_slider.dart';
import 'package:rearch_demo/features/home/ui/content_carousel.dart';
import 'package:rearch_demo/features/home/ui/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeroBanner(),
            const SizedBox(height: 16),
            const AutoBannerSlider(
              images: [
                'assets/images/banner_1.jpg',
                'assets/images/banner_2.jpg',
                'assets/images/banner_3.jpg',
              ],
              height: 180,
              showIndicators: false,
            ),
            const SizedBox(height: 16),
            ContentCarousel.test(),
          ],
        ),
      ),
    );
  }
}
