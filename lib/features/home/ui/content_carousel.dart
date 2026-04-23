import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/content_capsules.dart';

class ContentCarousel extends RearchConsumer {
  final String title;

  const ContentCarousel({super.key, this.title = '新着'});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final items = use(contentItemsCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = (constraints.maxWidth / 1000).clamp(0.85, 1.2);

        final horizontalPadding = 16 * scale;
        final verticalGap = 10 * scale;
        final titleFontSize = 20 * scale;
        final carouselHeight = (constraints.maxWidth * 0.3).clamp(160, 260).toDouble();
        final cardWidth = (constraints.maxWidth * 0.5).clamp(220, 320).toDouble();
        final itemGap = 12 * scale;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: verticalGap),

            /// Carousel with responsive sizing
            SizedBox(
              height: carouselHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                itemCount: items.length,
                separatorBuilder: (_, __) => SizedBox(width: itemGap),
                itemBuilder: (context, index) {
                  return _CardItem(
                    item: items[index],
                    cardWidth: cardWidth,
                    isMobile: isMobile,
                    isTablet: isTablet,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CardItem extends StatelessWidget {
  final CarouselItem item;
  final double cardWidth;
  final bool isMobile;
  final bool isTablet;

  const _CardItem({
    required this.item,
    required this.cardWidth,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive font sizes
    final dateFontSize = isMobile ? 9.0 : 11.0;
    final badgeFontSize = isMobile ? 8.0 : 10.0;
    final titleFontSize = isMobile ? 8.0 : 10.0;
    final subtitleFontSize = isMobile ? 8.5 : 10.0;
    final padding = isMobile ? 8.0 : 10.0;
    final gapSize = isMobile ? 3.0 : 4.0;
    final badgePadding = isMobile ? 4.0 : 6.0;

    return SizedBox(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header with date and NEW badge
          Row(
            children: [
              if (item.isNew)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: badgePadding,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '最新',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: badgeFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (item.isNew) SizedBox(width: gapSize),
              Expanded(
                child: Text(
                  item.date,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: dateFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: gapSize),

          /// Image Card
          Expanded(
            child: Column(
              children: [
                /// Image → 60%
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      color: Colors.black,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),

                /// Text Section → 40%
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(padding),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                          ),
                        ),
                        Spacer(),

                        /// Chip
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 10 : 12,
                              vertical: isMobile ? 4 : 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              item.catagory,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: badgeFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
  final String date;
  final bool isNew;
  final String catagory;

  const CarouselItem({
    required this.image,
    required this.title,
    required this.date,
    required this.catagory,
    this.isNew = false,
  });
}
