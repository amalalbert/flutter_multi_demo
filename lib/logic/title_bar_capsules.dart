import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

/// Title bar button configuration
class TitleBarButtonConfig {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  const TitleBarButtonConfig({
    required this.label,
    this.onPressed,
    this.backgroundColor,
  });
}

/// Title bar configuration
class TitleBarConfig {
  final String logoPath;
  final TitleBarButtonConfig primaryButton;
  final TitleBarButtonConfig secondaryButton;
  final Color primaryButtonColor;

  const TitleBarConfig({
    this.logoPath = 'assets/images/logo.png',
    this.primaryButton = const TitleBarButtonConfig(
      label: '新規会員申込み',
    ),
    this.secondaryButton = const TitleBarButtonConfig(
      label: 'ログイン',
    ),
    this.primaryButtonColor = const Color(0xFF00CFC8),
  });
}

/// Capsule that provides title bar configuration
TitleBarConfig titleBarConfigCapsule(CapsuleHandle use) {
  return TitleBarConfig(
    primaryButton: TitleBarButtonConfig(
      label: '新規会員申込み',
      onPressed: () {
        // TODO: Navigate to signup
      },
    ),
    secondaryButton: TitleBarButtonConfig(
      label: 'ログイン',
      onPressed: () {
        // TODO: Navigate to login
      },
    ),
  );
}
