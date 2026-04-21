import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/hero_capsules.dart';

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
        final height = isMobile ? 320.0 : isTablet ? 380.0 : 420.0;
        final smallTextSize = isMobile ? 11.0 : isTablet ? 12.0 : 14.0;
        final mainTitleSize = isMobile ? 22.0 : isTablet ? 26.0 : 32.0;
        final subtitleSize = isMobile ? 11.0 : isTablet ? 12.0 : 14.0;
        final buttonTextSize = isMobile ? 12.0 : 14.0;
        final disclaimerSize = isMobile ? 11.0 : 13.0;
        final horizontalPadding = isMobile ? 16.0 : isTablet ? 24.0 : 40.0;
        final topGap = isMobile ? 12.0 : 16.0;
        final titleGap = isMobile ? 12.0 : 16.0;
        final subtitleGap = isMobile ? 12.0 : 16.0;
        final ctaGap = isMobile ? 16.0 : 24.0;
        final disclaimerGap = isMobile ? 12.0 : 16.0;
        final buttonPaddingH = isMobile ? 28.0 : 40.0;
        final buttonPaddingV = isMobile ? 10.0 : 14.0;

        return SizedBox(
          height: height,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// Background image
              Image.asset(
                heroContent.backgroundImage,
                fit: BoxFit.cover,
              ),

              /// Dark overlay
              Container(
                color: Colors.black.withValues(
                    alpha: heroContent.overlayOpacity),
              ),

              /// Content with overflow handling
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: topGap),

                      /// Top small text
                      Text(
                        heroContent.smallText,
                        style: TextStyle(
                          color: heroContent.accentColor,
                          fontSize: smallTextSize,
                          letterSpacing: 0.8,
                        ),
                      ),

                      SizedBox(height: topGap),

                      /// Main title
                      Text(
                        heroContent.mainTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: mainTitleSize,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),

                      SizedBox(height: titleGap),

                      /// Subtitle
                      Text(
                        heroContent.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: subtitleSize,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: ctaGap),

                      /// CTA Button
                      ElevatedButton(
                        onPressed: heroContent.onButtonPressed ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: heroContent.accentColor,
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                            horizontal: buttonPaddingH,
                            vertical: buttonPaddingV,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          heroContent.buttonText,
                          style: TextStyle(
                            fontSize: buttonTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: disclaimerGap),

                      /// Disclaimer
                      Text(
                        heroContent.disclaimerText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: disclaimerSize,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: topGap),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}