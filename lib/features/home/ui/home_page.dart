import 'package:flutter/material.dart';
import 'package:rearch_demo/features/home/ui/auto_banner_slider.dart';
import 'package:rearch_demo/features/home/ui/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeroBanner(),
              SizedBox(height: 16),
              AutoBannerSlider(),
            ],
          ),
        ],
      ),
    );
  }
}
