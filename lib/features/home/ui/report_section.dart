import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/report_capsules.dart';

class ReportSection extends RearchConsumer {
  const ReportSection({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final items = use(reportItemsCapsule);
    final config = use(reportSectionConfigCapsule);

    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        /// 🔥 Responsive sizing
        final titleSize = isMobile
            ? 18.0
            : isTablet
            ? 20.0
            : 24.0;
        final verticalPadding = isMobile
            ? 16.0
            : isTablet
            ? 24.0
            : 30.0;
        final horizontalPadding = isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 20.0;
        final titleGap = isMobile ? 12.0 : 16.0;

        final imageHeight = isMobile
            ? 100.0
            : isTablet
            ? 140.0
            : 160.0;

        final cardTitleSize = isMobile
            ? 12.0
            : isTablet
            ? 13.0
            : 14.0;
        final cardDescSize = isMobile
            ? 11.0
            : isTablet
            ? 11.5
            : 12.0;

        final cardImageGap = isMobile ? 8.0 : 10.0;
        final cardDescGap = isMobile ? 4.0 : 6.0;
        final cardButtonGap = isMobile ? 12.0 : 16.0;

        final buttonTextSize = isMobile ? 11.0 : 12.0;
        final dividerMargin = isMobile ? 8.0 : 12.0;
        final dividerHeight = imageHeight + 160;
        final cardWidth = isMobile
            ? constraints.maxWidth * 0.8
            : isTablet
            ? 260.0
            : 300.0;

        return Container(
          color: config.backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔥 Title
              Text(
                config.title,
                style: TextStyle(
                  color: config.textColor,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: titleGap),

              /// 🔥 HORIZONTAL SCROLL SECTION
              SizedBox(
                height: imageHeight + 160, // 👈 critical
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        /// Card
                        SizedBox(
                          width: cardWidth,
                          child: _ReportCard(
                            item: items[index],
                            imageHeight: imageHeight,
                            cardTitleSize: cardTitleSize,
                            cardDescSize: cardDescSize,
                            cardImageGap: cardImageGap,
                            cardDescGap: cardDescGap,
                            cardButtonGap: cardButtonGap,
                            buttonTextSize: buttonTextSize,
                            buttonColor: config.buttonColor,
                            buttonLabel: config.buttonLabel,
                            onPressed: config.onDownloadPressed,
                          ),
                        ),

                        /// 🔥 Vertical Divider (except last item)
                        if (index != items.length - 1)
                          Container(
                            width: 1,
                            height: dividerHeight,
                            margin: EdgeInsets.symmetric(horizontal: dividerMargin),
                            color: Colors.black26,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ReportCard extends StatelessWidget {
  final ReportItem item;
  final double imageHeight;
  final double cardTitleSize;
  final double cardDescSize;
  final double cardImageGap;
  final double cardDescGap;
  final double cardButtonGap;
  final double buttonTextSize;
  final Color buttonColor;
  final String buttonLabel;
  final VoidCallback? onPressed;

  const _ReportCard({
    required this.item,
    required this.imageHeight,
    required this.cardTitleSize,
    required this.cardDescSize,
    required this.cardImageGap,
    required this.cardDescGap,
    required this.cardButtonGap,
    required this.buttonTextSize,
    required this.buttonColor,
    required this.buttonLabel,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Image
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            item.image,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(height: cardImageGap),

        /// Title
        Text(
          item.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: cardTitleSize,
          ),
        ),

        SizedBox(height: cardDescGap),

        /// Description
        Flexible(
          child: Text(
            item.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: cardDescSize),
          ),
        ),

        SizedBox(height: cardButtonGap),

        /// Button
        Center(
          child: ElevatedButton(
            onPressed: onPressed ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            ),
            child: Text(
              buttonLabel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: buttonTextSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ReportItem {
  final String image;
  final String title;
  final String description;

  const ReportItem({
    required this.image,
    required this.title,
    required this.description,
  });
}