import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/home/ui/top_ranking_carousel.dart';

/// Capsule that provides ranking items
/// In a real app, this would fetch from an API
List<RankedItem> rankingItemsCapsule(CapsuleHandle use) {
  return [
    const RankedItem(
      rank: 1,
      image: 'assets/images/banner_1.jpg',
      title: '16年連続全国1位！',
      date: '2026.3.1',
      catagory: '企業',
    ),
    const RankedItem(
      rank: 2,
      image: 'assets/images/banner_2.jpg',
      title: '成仏不動産 4年で売上13倍',
      date: '2026.3.1',
      catagory: '企業',
    ),
    const RankedItem(
      rank: 3,
      image: 'assets/images/banner_3.jpg',
      title: 'AI時代の採用戦略',
      date: '2026.2.28',
      catagory: '企業',
    ),
    const RankedItem(
      rank: 4,
      image: 'assets/images/banner_1.jpg',
      title: '地方企業の成長戦略',
      date: '2026.2.25',
      catagory: '企業',
    ),
    const RankedItem(
      rank: 5,
      image: 'assets/images/banner_2.jpg',
      title: 'DX導入の成功事例',
      date: '2026.2.20',
      catagory: '企業',
    ),
  ];
}
