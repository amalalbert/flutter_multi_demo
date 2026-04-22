import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

/// Configuration for industry section
class IndustrySectionConfig {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color chipBackgroundColor;

  const IndustrySectionConfig({
    this.title = '業種別でコンテンツを探す',
    this.backgroundColor = const Color(0xFF000000),
    this.textColor = Colors.white,
    this.chipBackgroundColor = const Color(0xFF2E2E2E),
  });
}

/// Capsule that provides industry categories
List<String> industryCategoriesCapsule(CapsuleHandle use) {
  return const [
    '農業、林業',
    '漁業',
    '鉱業、採石業、砂利採取業',
    '製造業',
    '電気・ガス・熱供給・水道業',
    '情報通信業',
    '運輸業、郵便業',
    '卸売業、小売業',
    '金融業、保険業',
    '不動産業、物品賃貸業',
    '学術研究、専門・技術サービス業',
    '宿泊業、飲食サービス業',
    '生活関連サービス業、娯楽業',
    '教育、学習支援業',
    'サービス業（他に分類されないもの）',
    '公務（他に分類されるものを除く）',
    '分類不能の産業',
    '医療、福祉',
    '複合サービス事業',
  ];
}

/// Capsule that provides industry section configuration
IndustrySectionConfig industrySectionConfigCapsule(CapsuleHandle use) {
  return const IndustrySectionConfig();
}

/// Capsule that provides theme/topic categories
List<String> themeCategoriesCapsule(CapsuleHandle use) {
  return const [
    '経営戦略。グループ会社の経営',
    'AI・dx',
    'M&A・事業承継',
    'デジタルマーク・ブランディング',
    '新規事業・史上調査・販路開拓',
    '新規上場',
    '補助金活用・財務会計・資金調達',
    'HD（人的資本経営）',
    'サステナビリティ',
  ];
}

/// Capsule that provides theme section configuration
IndustrySectionConfig themeSectionConfigCapsule(CapsuleHandle use) {
  return const IndustrySectionConfig(
    title: 'テーマ別でコンテンツを探す',
  );
}