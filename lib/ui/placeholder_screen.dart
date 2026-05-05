import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String japaneseText;

  const PlaceholderScreen({
    super.key,
    this.title = 'Under preparation',
    this.subtitle = 'This page is not ready yet. Please check back later.',
    this.japaneseText = '準備中です。しばらくしてから再度お試しください。',
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final isMobile = screenSize.width < 600;

    // Responsive sizing
    final padding = isMobile ? 20.0 : 32.0;
    final titleFontSize = isMobile ? 24.0 : 32.0;
    final bodyFontSize = isMobile ? 14.0 : 16.0;
    final verticalSpacing = isMobile ? 12.0 : 16.0;
    final largeSpacing = isMobile ? 20.0 : 32.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: largeSpacing),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: verticalSpacing),
                  Text(
                    japaneseText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: bodyFontSize,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}