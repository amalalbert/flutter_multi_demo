import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/banner_capsules.dart';

/// Wrapper using Rearch for configuration
class AutoBannerSlider extends RearchConsumer {
  final List<String>? images;
  final double? height;
  final Duration? autoScrollDuration;
  final Duration? animationDuration;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final bool showIndicators;

  const AutoBannerSlider({
    super.key,
    this.images,
    this.height,
    this.autoScrollDuration,
    this.animationDuration,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding = EdgeInsets.zero,
    this.showIndicators = false,
  });

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final bannerImages = images ?? use(bannerImagesCapsule);
    final config = use(bannerSliderConfigCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        final defaultHeight = isMobile ? 160.0 : isTablet ? 200.0 : 240.0;
        final finalHeight = height ?? defaultHeight;
        final indicatorMargin = isMobile ? 3.0 : 4.0;
        final indicatorSize = isMobile ? 5.0 : 6.0;
        final indicatorActiveSize = isMobile ? 8.0 : 10.0;
        final indicatorBottomPadding = isMobile ? 8.0 : 12.0;

        return _AutoBannerSliderContent(
          images: bannerImages,
          height: finalHeight,
          autoScrollDuration: autoScrollDuration ?? config.autoScrollDuration,
          animationDuration: animationDuration ?? config.animationDuration,
          borderRadius: borderRadius,
          padding: padding,
          showIndicators: showIndicators,
          indicatorMargin: indicatorMargin,
          indicatorSize: indicatorSize,
          indicatorActiveSize: indicatorActiveSize,
          indicatorBottomPadding: indicatorBottomPadding,
        );
      },
    );
  }
}

/// Internal stateful widget for animation handling
class _AutoBannerSliderContent extends StatefulWidget {
  final List<String>? images;
  final double height;
  final Duration autoScrollDuration;
  final Duration animationDuration;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final bool showIndicators;
  final double indicatorMargin;
  final double indicatorSize;
  final double indicatorActiveSize;
  final double indicatorBottomPadding;

  const _AutoBannerSliderContent({
    required this.images,
    required this.height,
    required this.autoScrollDuration,
    required this.animationDuration,
    required this.borderRadius,
    required this.padding,
    required this.showIndicators,
    required this.indicatorMargin,
    required this.indicatorSize,
    required this.indicatorActiveSize,
    required this.indicatorBottomPadding,
  });

  @override
  State<_AutoBannerSliderContent> createState() =>
      _AutoBannerSliderContentState();
}

class _AutoBannerSliderContentState extends State<_AutoBannerSliderContent> {
  late final PageController _controller;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController();

    _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (!_controller.hasClients || widget.images?.isEmpty == true) return;

      _currentPage = (_currentPage + 1) % (widget.images?.length ?? 0);

      _controller.animateToPage(
        _currentPage,
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images?.isEmpty == true) {
      return SizedBox(height: widget.height);
    }

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images?.length ?? 0,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: widget.padding,
                child: ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: Image.asset(
                    widget.images?[index] ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          /// Responsive indicators
          if (widget.showIndicators)
            Positioned(
              bottom: widget.indicatorBottomPadding,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images?.length ?? 0, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(
                        horizontal: widget.indicatorMargin),
                    width:
                        _currentPage == index
                            ? widget.indicatorActiveSize
                            : widget.indicatorSize,
                    height: widget.indicatorSize,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: BorderRadius.circular(
                          widget.indicatorSize / 2),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}