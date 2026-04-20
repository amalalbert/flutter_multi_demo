import 'dart:async';
import 'package:flutter/material.dart';

class AutoBannerSlider extends StatefulWidget {
  final List<String> images;
  final double height;
  final Duration autoScrollDuration;
  final Duration animationDuration;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final bool showIndicators;

  const AutoBannerSlider({
    super.key,
    required this.images,
    this.height = 180,
    this.autoScrollDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 400),
    this.borderRadius = BorderRadius.zero,
    this.padding = EdgeInsets.zero,
    this.showIndicators = false,
  });

  @override
  State<AutoBannerSlider> createState() => _AutoBannerSliderState();
}

class _AutoBannerSliderState extends State<AutoBannerSlider> {
  late final PageController _controller;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController();

    _timer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (!_controller.hasClients || widget.images.isEmpty) return;

      _currentPage = (_currentPage + 1) % widget.images.length;

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
    if (widget.images.isEmpty) {
      return const SizedBox(); // safe fallback
    }

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: widget.padding,
                child: ClipRRect(
                  borderRadius: widget.borderRadius,
                  child: Image.asset(
                    widget.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          /// 🔥 Indicators (optional)
          if (widget.showIndicators)
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 10 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: BorderRadius.circular(3),
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