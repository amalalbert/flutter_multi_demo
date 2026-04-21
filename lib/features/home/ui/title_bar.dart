import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/title_bar_capsules.dart';

class TitleBar extends RearchConsumer implements PreferredSizeWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final config = use(titleBarConfigCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    // Responsive sizing
    final logoHeight = isMobile ? 24.0 : isTablet ? 28.0 : 32.0;
    final buttonMinWidth = isMobile ? 80.0 : isTablet ? 100.0 : 120.0;
    final buttonMinHeight = isMobile ? 32.0 : 40.0;
    final buttonPaddingH = isMobile ? 8.0 : isTablet ? 12.0 : 16.0;
    final buttonTextSize = isMobile ? 9.0 : isTablet ? 10.0 : 12.0;
    final buttonGap = isMobile ? 6.0 : isTablet ? 8.0 : 12.0;
    final appBarHeight = isMobile ? 48.0 : isTablet ? 56.0 : 64.0;

    return AppBar(
      toolbarHeight: appBarHeight,
      title: Image.asset(
        config.logoPath,
        height: logoHeight,
        fit: BoxFit.contain,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: buttonGap),
          child: _ResponsiveButton(
            label: config.primaryButton.label,
            onPressed: config.primaryButton.onPressed,
            isOutlined: false,
            minWidth: buttonMinWidth,
            minHeight: buttonMinHeight,
            paddingH: buttonPaddingH,
            textSize: buttonTextSize,
            backgroundColor: config.primaryButtonColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: buttonGap),
          child: _ResponsiveButton(
            label: config.secondaryButton.label,
            onPressed: config.secondaryButton.onPressed,
            isOutlined: true,
            minWidth: buttonMinWidth,
            minHeight: buttonMinHeight,
            paddingH: buttonPaddingH,
            textSize: buttonTextSize,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Helper widget for responsive buttons
class _ResponsiveButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isOutlined;
  final double minWidth;
  final double minHeight;
  final double paddingH;
  final double textSize;
  final Color? backgroundColor;

  const _ResponsiveButton({
    required this.label,
    required this.onPressed,
    required this.isOutlined,
    required this.minWidth,
    required this.minHeight,
    required this.paddingH,
    required this.textSize,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return OutlinedButton(
        onPressed: onPressed ?? () {},
        style: OutlinedButton.styleFrom(
          minimumSize: Size(minWidth, minHeight),
          padding: EdgeInsets.symmetric(horizontal: paddingH),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    }

    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.black,
        minimumSize: Size(minWidth, minHeight),
        padding: EdgeInsets.symmetric(horizontal: paddingH),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: textSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
