import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

/// Configuration for CTA section
class CTASectionConfig {
  final String mainText;
  final String buttonText;
  final String subtextMessage;
  final Color backgroundColor;
  final Color textColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final double overlayOpacity;
  final String backgroundImagePath;
  final VoidCallback? onButtonPressed;

  const CTASectionConfig({
    this.mainText = '経営者の「決断」を支える、確かな拠り所がここにある。\n'
        'あなたの次の一手を確信に変える、船井総研の実践知。',
    this.buttonText = '新規会員申込み',
    this.subtextMessage = '※無料・有料版からお選びください',
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.buttonColor = const Color(0xFF00CFC8),
    this.buttonTextColor = Colors.black,
    this.overlayOpacity = 0.7,
    this.backgroundImagePath = 'assets/images/cta_bg.jpg',
    this.onButtonPressed,
  });
}

/// Capsule that provides CTA section configuration
CTASectionConfig ctaSectionConfigCapsule(CapsuleHandle use) {
  return const CTASectionConfig(
    onButtonPressed: null, // TODO: Handle button press
  );
}
