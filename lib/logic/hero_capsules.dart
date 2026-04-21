import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

/// Hero banner content data
class HeroContent {
  final String backgroundImage;
  final String smallText;
  final String mainTitle;
  final String subtitle;
  final String buttonText;
  final String disclaimerText;
  final Color accentColor;
  final double overlayOpacity;
  final VoidCallback? onButtonPressed;

  const HeroContent({
    this.backgroundImage = 'assets/images/hero_bg.jpg',
    this.smallText = 'Business Media of Funai Soken',
    this.mainTitle = '船井総研の\n経営メディア',
    this.subtitle =
        '経営者の「決断」を支える、確かな拠り所がここにある。\nあなたの次の一手を確信に変える、船井総研の実践知。',
    this.buttonText = '新規会員申込み',
    this.disclaimerText = '※無料・有料版からお選びください',
    this.accentColor = const Color(0xFF00CFC8),
    this.overlayOpacity = 0.6,
    this.onButtonPressed,
  });
}

/// Capsule that provides hero banner content
HeroContent heroBannerContentCapsule(CapsuleHandle use) {
  return HeroContent(
    onButtonPressed: () {
      // TODO: Navigate to signup or trigger desired action
    },
  );
}
