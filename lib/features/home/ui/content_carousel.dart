import 'package:flutter/material.dart';
class ContentCarousel extends StatelessWidget {
  final String title;
  final List<CarouselItem> items;

  const ContentCarousel({
    super.key,
    required this.title,
    required this.items,
  });

  /// 🔥 Test constructor
  factory ContentCarousel.test() {
    return ContentCarousel(
      title: '新着',
      items: const [
        CarouselItem(
          image: 'assets/images/banner_1.jpg',
          title: '16年連続全国1位！',
          subtitle: '山一地所の強みは、業界の常識を覆す経営戦略にあった',
        ),
        CarouselItem(
          image: 'assets/images/banner_2.jpg',
          title: '成仏不動産',
          subtitle: '4年で売上13倍、年商78億円。',
        ),
        CarouselItem(
          image: 'assets/images/banner_3.jpg',
          title: '経営戦略',
          subtitle: '次の一手を確信に変える',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// Carousel
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return _CardItem(item: items[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _CardItem extends StatelessWidget {
  final CarouselItem item;

  const _CardItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          /// Image
          Positioned.fill(
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),

          /// Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          /// Text
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselItem {
  final String image;
  final String title;
  final String subtitle;

  const CarouselItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}