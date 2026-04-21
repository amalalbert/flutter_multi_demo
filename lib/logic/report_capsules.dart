import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/home/ui/report_section.dart';

/// Configuration for report section
class ReportSectionConfig {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color buttonColor;
  final String buttonLabel;
  final VoidCallback? onDownloadPressed;

  const ReportSectionConfig({
    this.title = 'ビジネスレポート無料ダウンロード',
    this.backgroundColor = const Color(0xFFB8B8B8),
    this.textColor = Colors.black,
    this.buttonColor = const Color(0xFF00CFC8),
    this.buttonLabel = 'ダウンロード',
    this.onDownloadPressed,
  });
}

/// Capsule that provides report items
List<ReportItem> reportItemsCapsule(CapsuleHandle use) {
  return const [
    ReportItem(
      image: 'assets/images/q2.png',
      title: '16年連続全国1位！山一地所の強みは、業界の常識を覆す 経営戦略にあった',
      description: '1、なぜ今、中小企業の「国際税務」が危ないのか/2、海外進出するなら知っておきた…',
    ),
    ReportItem(
      image: 'assets/images/q3.png',
      title: '16年連続全国1位！ 山一地所の強みは、業界の常識を覆す 経営戦略にあった',
      description: '1、なぜ今、中小企業の「国際税務」が危ないのか/2、海外進出するなら知っておきた…',
    ),
    ReportItem(
      image: 'assets/images/q4.png',
      title: '16年連続全国1位！ 山一地所の強みは、業界の常識を覆す 経営戦略にあった',
      description: '1、なぜ今、中小企業の「国際税務」が危ないのか/2、海外進出するなら知っておきた…',
    ),
    ReportItem(
      image: 'assets/images/q5.png',
      title: '16年連続全国1位！ 山一地所の強みは、業界の常識を覆す 経営戦略にあった',
      description: '1、なぜ今、中小企業の「国際税務」が危ないのか/2、海外進出するなら知っておきた…',
    ),
  ];
}

/// Capsule that provides report section configuration
ReportSectionConfig reportSectionConfigCapsule(CapsuleHandle use) {
  return ReportSectionConfig(
    onDownloadPressed: () {
      // TODO: Handle download
    },
  );
}
