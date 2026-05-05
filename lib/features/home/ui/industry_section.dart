import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';
import 'package:rearch_demo/logic/industry_capsules.dart';

class IndustrySection extends RearchConsumer {
  final Capsule<List<String>> categoriesCapsule;
  final Capsule<IndustrySectionConfig> configCapsule;

  const IndustrySection({
    super.key,
    required this.categoriesCapsule,
    required this.configCapsule,
  });

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final categories = use(categoriesCapsule);
    final config = use(configCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing
        final verticalPadding = isMobile
            ? 24.0
            : isTablet
            ? 32.0
            : 40.0;
        final horizontalPadding = isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 20.0;
        final titleFontSize = isMobile
            ? 18.0
            : isTablet
            ? 20.0
            : 24.0;
        final titleGap = isMobile ? 16.0 : 24.0;
        final chipPaddingH = isMobile
            ? 12.0
            : isTablet
            ? 14.0
            : 16.0;
        final chipPaddingV = isMobile ? 8.0 : 10.0;
        final chipFontSize = isMobile
            ? 11.0
            : isTablet
            ? 12.0
            : 13.0;
        final chipSpacing = isMobile
            ? 8.0
            : isTablet
            ? 10.0
            : 12.0;
        final chipRunSpacing = isMobile
            ? 8.0
            : isTablet
            ? 10.0
            : 12.0;

        return Container(
          color: config.backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Column(
            children: [
              /// Title
              Text(
                config.title,
                style: TextStyle(
                  color: config.textColor,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: titleGap),

              /// Chips (wrapped layout)
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: chipSpacing,
                  runSpacing: chipRunSpacing,
                  children: categories.map((category) {
                    return _CategoryChip(
                      label: category,
                      paddingH: chipPaddingH,
                      paddingV: chipPaddingV,
                      fontSize: chipFontSize,
                      textColor: config.textColor,
                      backgroundColor: config.chipBackgroundColor,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final double paddingH;
  final double paddingV;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;

  const _CategoryChip({
    required this.label,
    required this.paddingH,
    required this.paddingV,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(24);
    // InkWell splashes paint *behind* a normal child on [Material], so opaque
    // [Text] hides the ripple. [Ink] merges with the splash layer so the ripple
    // shows on top of the chip background.
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          debugPrint('Clicked Item with ripple');
        },
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingH,
              vertical: paddingV,
            ),
            child: Text(
              label,
              style: TextStyle(color: textColor, fontSize: fontSize,decoration: TextDecoration.none,),
            ),
          ),
        ),
      ),
    );
  }
}