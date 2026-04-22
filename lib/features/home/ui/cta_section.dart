import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/cta_capsules.dart';

class CTASection extends RearchConsumer {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final config = use(ctaSectionConfigCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing
        final sectionHeight = isMobile ? 280.0 : isTablet ? 320.0 : 380.0;
        final verticalPadding = isMobile ? 20.0 : isTablet ? 28.0 : 36.0;
        final horizontalPadding = isMobile ? 16.0 : isTablet ? 24.0 : 32.0;
        final mainTextFontSize = isMobile ? 13.0 : isTablet ? 14.0 : 16.0;
        final mainTextLineHeight = isMobile ? 1.5 : 1.6;
        final textGap = isMobile ? 16.0 : isTablet ? 20.0 : 24.0;
        final buttonPaddingH = isMobile ? 32.0 : isTablet ? 40.0 : 48.0;
        final buttonPaddingV = isMobile ? 12.0 : 14.0;
        final buttonFontSize = isMobile ? 13.0 : isTablet ? 14.0 : 15.0;
        final buttonRadius = isMobile ? 24.0 : 30.0;
        final subtextFontSize = isMobile ? 10.0 : isTablet ? 10.5 : 11.0;
        final subtextGap = isMobile ? 10.0 : 12.0;

        return SizedBox(
          height: sectionHeight,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// 🔥 Background Image
              Image.asset(
                config.backgroundImagePath,
                fit: BoxFit.cover,
              ),

              /// 🔥 Dark overlay
              Container(
                color: config.backgroundColor.withOpacity(config.overlayOpacity),
              ),

              /// 🔥 Content
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Main Text
                      Text(
                        config.mainText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: config.textColor,
                          fontSize: mainTextFontSize,
                          height: mainTextLineHeight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: textGap),

                      /// 🔥 CTA Button
                      ElevatedButton(
                        onPressed: config.onButtonPressed ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: config.buttonColor,
                          foregroundColor: config.buttonTextColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: buttonPaddingH,
                            vertical: buttonPaddingV,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          config.buttonText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: buttonFontSize,
                          ),
                        ),
                      ),

                      SizedBox(height: subtextGap),

                      /// Subtext
                      Text(
                        config.subtextMessage,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: subtextFontSize,
                        ),
                      ),
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