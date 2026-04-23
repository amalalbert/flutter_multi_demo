import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/cta_capsules.dart';

class CTASection extends RearchConsumer {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final config = use(ctaSectionConfigCapsule);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing
        final width = constraints.maxWidth;

        /// ---- Scaling factor (core idea) ----
        final scale = (width / 1000).clamp(0.85, 1.25);

        /// ---- Heights ----
        final sectionHeight = (width * 0.35).clamp(260.0, 420.0);

        /// ---- Spacing ----
        final verticalPadding = 24.0 * scale;
        final horizontalPadding = 20.0 * scale;
        final textGap = 20.0 * scale;
        final subtextGap = 12.0 * scale;

        /// ---- Typography ----
        final mainTextFontSize = (14.0 * scale).clamp(13.0, 17.0);
        final mainTextLineHeight = 1.5 + ((scale - 1) * 0.2);
        final subtextFontSize = (10.5 * scale).clamp(10.0, 12.0);

        /// ---- Button ----
        final buttonPaddingH = 40.0 * scale;
        final buttonPaddingV = 13.0 * scale;
        final buttonFontSize = (14.0 * scale).clamp(13.0, 16.0);
        final buttonRadius = 26.0 * scale;

        return SizedBox(
          height: sectionHeight,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// 🔥 Background Image
              Image.asset(config.backgroundImagePath, fit: BoxFit.cover),

              /// 🔥 Dark overlay
              Container(
                color: config.backgroundColor.withOpacity(
                  config.overlayOpacity,
                ),
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