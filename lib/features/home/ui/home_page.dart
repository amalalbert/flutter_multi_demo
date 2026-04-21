import 'package:flutter/material.dart';
import 'package:rearch_demo/features/home/ui/auto_banner_slider.dart';
import 'package:rearch_demo/features/home/ui/content_carousel.dart';
import 'package:rearch_demo/features/home/ui/hero_section.dart';
import 'package:rearch_demo/features/home/ui/report_section.dart';
import 'package:rearch_demo/features/home/ui/search_section.dart';
import 'package:rearch_demo/features/home/ui/top_ranking_carousel.dart';

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
              height: 180,
              showIndicators: false,
            ),
            const SizedBox(height: 16),
            const ContentCarousel(title: '新着'),
            const SizedBox(height: 16),
            const TopRankingCarousel(title: '人気記事ランキング'),
            const SizedBox(height: 16),
            const ReportSection(),
            const SizedBox(height: 24),
            const SearchSection()
          ],
        ),
      ),
    );
  }
}