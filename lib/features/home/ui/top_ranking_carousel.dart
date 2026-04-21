import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/ranking_capsules.dart';

class TopRankingCarousel extends RearchConsumer {
  final String title;

  const TopRankingCarousel({
    super.key,
    this.title = '人気記事ランキング',
  });

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final items = use(rankingItemsCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = isMobile ? 12.0 : 16.0;
        final verticalGap = isMobile ? 12.0 : 16.0;
        final titleFontSize = isMobile ? 18.0 : 22.0;
        final carouselHeight = isMobile ? 200.0 : isTablet ? 240.0 : 260.0;

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
                separatorBuilder: (_, __) =>
                    SizedBox(width: horizontalPadding),
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
    final cardWidth = isMobile ? 200.0 : isTablet ? 240.0 : 280.0;
    final rankFontSize = isMobile ? 60.0 : 80.0;
    final rankTopOffset = isMobile ? -20.0 : -30.0;
    final cardTopOffset = isMobile ? 45.0 : 60.0;
    final titleFontSize = isMobile ? 11.0 : 13.0;
    final subtitleFontSize = isMobile ? 9.5 : 11.0;
    final dateFontSize = isMobile ? 8.0 : 10.0;
    final padding = isMobile ? 8.0 : 10.0;
    final contentPadding = isMobile ? 3.0 : 4.0;

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
              child: Stack(
                children: [
                  /// Image
                  Positioned.fill(
                    child: Image.asset(item.image, fit: BoxFit.cover),
                  ),

                  /// Gradient overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
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

                  /// Bottom text
                  Positioned(
                    bottom: padding,
                    left: padding,
                    right: padding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: titleFontSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: contentPadding),
                        Text(
                          item.subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: subtitleFontSize,
                          ),
                        ),
                      ],
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
  final String subtitle;
  final String date;

  const RankedItem({
    required this.rank,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.date,
  });
}