import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/home/ui/content_carousel.dart';

/// Capsule that provides content carousel items
/// In a real app, this would fetch from an API
List<CarouselItem> contentItemsCapsule(CapsuleHandle use) {
  return const [
    CarouselItem(
      image: 'assets/images/banner_1.jpg',
      title: '16年連続全国1位！',
      subtitle: '山一地所の強みは、業界の常識を覆す経営戦略にあった',
      date: '2024/06/20',
      isNew: true,
      catagory: '農業、林業',
    ),
    CarouselItem(
      image: 'assets/images/banner_2.jpg',
      title: '成仏不動産',
      subtitle: '4年で売上13倍、年商78億円。',
      date: '2024/06/18',
      catagory: '卸売業、小売業',
    ),
    CarouselItem(
      image: 'assets/images/banner_3.jpg',
      title: '経営戦略',
      subtitle: '次の一手を確信に変える',
      date: '2024/06/15',
      catagory: '農業、林業',
    ),
  ];
}
