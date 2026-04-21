import 'package:rearch/rearch.dart';

/// Configuration for banner slider
class BannerSliderConfig {
  final Duration autoScrollDuration;
  final Duration animationDuration;

  const BannerSliderConfig({
    this.autoScrollDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 400),
  });
}

/// Capsule that provides banner images
/// In a real app, this would fetch from an API
List<String> bannerImagesCapsule(CapsuleHandle use) {
  return const [
    'assets/images/banner_1.jpg',
    'assets/images/banner_2.jpg',
    'assets/images/banner_3.jpg',
  ];
}

/// Capsule that provides slider configuration
BannerSliderConfig bannerSliderConfigCapsule(CapsuleHandle use) {
  return const BannerSliderConfig(
    autoScrollDuration: Duration(seconds: 3),
    animationDuration: Duration(milliseconds: 400),
  );
}
