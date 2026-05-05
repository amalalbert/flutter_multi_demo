import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/hero_capsules.dart';
import 'package:rearch_demo/ui/placeholder_screen.dart';

class HeroBanner extends RearchConsumer {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final heroContent = use(heroBannerContentCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing
        final height = isMobile
            ? 320.0
            : isTablet
            ? 380.0
            : 420.0;

        final smallTextSize = isMobile
            ? 11.0
            : isTablet
            ? 12.0
            : 14.0;
        final mainTitleSize = isMobile
            ? 22.0
            : isTablet
            ? 26.0
            : 32.0;
        final subtitleSize = isMobile
            ? 11.0
            : isTablet
            ? 12.0
            : 14.0;
        final buttonTextSize = isMobile ? 12.0 : 14.0;
        final disclaimerSize = isMobile ? 11.0 : 13.0;

        final horizontalPadding = isMobile
            ? 16.0
            : isTablet
            ? 24.0
            : 40.0;

        final topGap = isMobile ? 12.0 : 16.0;
        final titleGap = isMobile ? 12.0 : 16.0;
        final ctaGap = isMobile ? 16.0 : 24.0;
        final disclaimerGap = isMobile ? 12.0 : 16.0;

        final buttonPaddingH = isMobile ? 28.0 : 40.0;
        final buttonPaddingV = isMobile ? 10.0 : 14.0;

        return SizedBox(
          height: height,
          width: double.infinity,
          child: _HeroContent(
            height: height,
            heroContent: heroContent,
            horizontalPadding: horizontalPadding,
            smallTextSize: smallTextSize,
            mainTitleSize: mainTitleSize,
            subtitleSize: subtitleSize,
            buttonTextSize: buttonTextSize,
            disclaimerSize: disclaimerSize,
            topGap: topGap,
            titleGap: titleGap,
            ctaGap: ctaGap,
            disclaimerGap: disclaimerGap,
            buttonPaddingH: buttonPaddingH,
            buttonPaddingV: buttonPaddingV,
          ),
        );
      },
    );
  }
}

class _HeroContent extends StatefulWidget {
  final double height;
  final dynamic heroContent;

  final double horizontalPadding;
  final double smallTextSize;
  final double mainTitleSize;
  final double subtitleSize;
  final double buttonTextSize;
  final double disclaimerSize;

  final double topGap;
  final double titleGap;
  final double ctaGap;
  final double disclaimerGap;

  final double buttonPaddingH;
  final double buttonPaddingV;

  const _HeroContent({
    required this.height,
    required this.heroContent,
    required this.horizontalPadding,
    required this.smallTextSize,
    required this.mainTitleSize,
    required this.subtitleSize,
    required this.buttonTextSize,
    required this.disclaimerSize,
    required this.topGap,
    required this.titleGap,
    required this.ctaGap,
    required this.disclaimerGap,
    required this.buttonPaddingH,
    required this.buttonPaddingV,
  });

  @override
  State<_HeroContent> createState() => _HeroContentState();
}

class _HeroContentState extends State<_HeroContent> {
  double contentWidth = 0;

  @override
  Widget build(BuildContext context) {
    final c = widget.heroContent;

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        /// Background
        Image.asset(c.backgroundImage, fit: BoxFit.cover),

        /// Gradient (full height, matches content width)
        if (contentWidth > 0)
          Positioned.fill(
            child: Center(
              child: SizedBox(
                width: contentWidth,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black.withValues(alpha: 0.0),
                        Colors.black.withValues(alpha: 0.95),
                        Colors.black.withValues(alpha: 1.0),
                        Colors.black.withValues(alpha: 1.0),
                        Colors.black.withValues(alpha: 1.0),
                        Colors.black.withValues(alpha: 1.0),
                        Colors.black.withValues(alpha: 0.0),
                      ],
                      stops: [0.0, 0.37, 0.39, 0.48, 0.51, 0.61, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),

        /// Content (measured + scaled)
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
            child: MeasureSize(
              onChange: (size) {
                if (contentWidth != size.width) {
                  setState(() => contentWidth = size.width);
                }
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: widget.topGap),

                      Text(
                        c.smallText,
                        style: TextStyle(
                          color: c.accentColor,
                          fontSize: widget.smallTextSize,
                          letterSpacing: 0.8,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      SizedBox(height: widget.topGap),

                      Text(
                        c.mainTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.mainTitleSize,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      SizedBox(height: widget.titleGap),

                      Text(
                        c.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: widget.subtitleSize,
                          height: 1.5,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      SizedBox(height: widget.ctaGap),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (context) => const PlaceholderScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: c.accentColor,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.buttonPaddingH,
                            vertical: widget.buttonPaddingV,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          c.buttonText,
                          style: TextStyle(
                            fontSize: widget.buttonTextSize,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),

                      SizedBox(height: widget.disclaimerGap),

                      Text(
                        c.disclaimerText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: widget.disclaimerSize,
                          height: 1.5,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      SizedBox(height: widget.topGap),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Size measurement helper
class MeasureSize extends StatefulWidget {
  final Widget child;
  final Function(Size) onChange;

  const MeasureSize({required this.child, required this.onChange, super.key});

  @override
  State<MeasureSize> createState() => _MeasureSizeState();
}

class _MeasureSizeState extends State<MeasureSize> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = context.size;
      if (size != null) widget.onChange(size);
    });

    return widget.child;
  }
}