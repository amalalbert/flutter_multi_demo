import 'package:flutter/material.dart';
import 'package:rearch/rearch.dart';

/// Configuration for search section
class SearchSectionConfig {
  final String title;
  final String hintText;
  final String searchIconTooltip;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onSearchPressed;
  final Function(String)? onSearchInputChanged;

  const SearchSectionConfig({
    this.title = 'キーワードコンテンツを探す',
    this.hintText = 'ジャンル・用語・講師名などで検索',
    this.searchIconTooltip = '検索',
    this.backgroundColor = const Color(0xFF000000),
    this.textColor = Colors.white,
    this.onSearchPressed,
    this.onSearchInputChanged,
  });
}

/// Capsule that provides search section configuration
SearchSectionConfig searchSectionConfigCapsule(CapsuleHandle use) {
  return SearchSectionConfig(
    onSearchPressed: () {
      // TODO: Handle search
    },
    onSearchInputChanged: (query) {
      // TODO: Handle input change
    },
  );
}