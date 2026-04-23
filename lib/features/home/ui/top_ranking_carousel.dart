import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/ranking_capsules.dart';

class TopRankingCarousel extends RearchConsumer {
  final String title;

  const TopRankingCarousel({super.key, this.title = '人気記事ランキング'});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final items = use(rankingItemsCapsule);
    final width = MediaQuery.of(context).size.width;

    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 20.0;
        final verticalGap = isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 20.0;

        final carouselHeight = (constraints.maxWidth * 0.4).clamp(200.0, 320.0);

        final titleFontSize = (constraints.maxWidth * 0.02).clamp(18.0, 24.0);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Section Title
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

            /// Horizontal list with responsive sizing
            SizedBox(
              height: carouselHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                itemCount: items.length,
                separatorBuilder: (_, __) => SizedBox(width: horizontalPadding),
                itemBuilder: (context, index) {
                  return _RankedCard(
                    item: items[index],
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

class _RankedCard extends StatelessWidget {
  final RankedItem item;
  final bool isMobile;
  final bool isTablet;

  const _RankedCard({
    required this.item,
    required this.isMobile,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive sizing
    final cardWidth = isMobile
        ? 240.0
        : isTablet
        ? 280.0
        : 320.0;
    final rankFontSize = isMobile ? 60.0 : 80.0;
    final rankTopOffset = isMobile ? -20.0 : -30.0;
    final cardTopOffset = isMobile ? 45.0 : 60.0;
    final titleFontSize = isMobile ? 11.0 : 13.0;
    final badgeFontSize = isMobile ? 8.0 : 10.0;
    final dateFontSize = isMobile ? 8.0 : 10.0;
    final padding = isMobile ? 8.0 : 10.0;

    return SizedBox(
      width: cardWidth,
      child: Stack(
        children: [
          /// Rank number background
          Positioned(
            top: rankTopOffset,
            left: 0,
            child: Text(
              '${item.rank}',
              style: TextStyle(
                fontSize: rankFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white.withValues(alpha: 0.85),
              ),
            ),
          ),

          /// Card container
          Positioned(
            top: cardTopOffset,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  /// Image → 60%
                  Expanded(
                    flex: 6,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(item.image, fit: BoxFit.cover),
                        ),

                        /// Date (top-right)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Text(
                            item.date,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: dateFontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Text → 40%
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(padding),
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
          ),
        ],
      ),
    );
  }
}

class RankedItem {
  final int rank;
  final String image;
  final String title;
  final String date;
  final String catagory;

  const RankedItem({
    required this.rank,
    required this.image,
    required this.title,
    required this.date,
    required this.catagory,
  });
}