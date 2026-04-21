import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch_demo/logic/search_capsules.dart';

class SearchSection extends RearchConsumer {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final config = use(searchSectionConfigCapsule);
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing
        final verticalPadding = isMobile
            ? 24.0
            : isTablet
            ? 32.0
            : 40.0;
        final horizontalPadding = isMobile
            ? 12.0
            : isTablet
            ? 16.0
            : 20.0;
        final titleFontSize = isMobile
            ? 18.0
            : isTablet
            ? 20.0
            : 24.0;
        final titleGap = isMobile ? 16.0 : 24.0;
        final searchBarHeight = isMobile
            ? 44.0
            : isTablet
            ? 48.0
            : 50.0;
        final searchBarPadding = isMobile ? 12.0 : 16.0;
        final searchBarMaxWidth = isMobile
            ? 320.0
            : isTablet
            ? 500.0
            : 600.0;
        final hintFontSize = isMobile
            ? 13.0
            : isTablet
            ? 14.0
            : 15.0;
        final iconSize = isMobile ? 20.0 : 24.0;

        return Container(
          color: config.backgroundColor,
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          child: Column(
            children: [
              /// Title
              Text(
                config.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: config.textColor,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: titleGap),

              /// Search Bar
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: searchBarMaxWidth),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: searchBarPadding),
                    height: searchBarHeight,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      children: [
                        /// Input field
                        Expanded(
                          child: TextField(
                            onChanged: config.onSearchInputChanged,
                            smartDashesType: SmartDashesType.disabled,
                            style: TextStyle(
                              color: config.textColor,
                              fontSize: hintFontSize,
                            ),
                            decoration: InputDecoration(
                              hintText: config.hintText,
                              hintStyle: TextStyle(
                                color: Colors.white60,
                                fontSize: hintFontSize,
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),

                        /// Search icon
                        IconButton(
                          onPressed: config.onSearchPressed ?? () {},
                          tooltip: config.searchIconTooltip,
                          iconSize: iconSize,
                          icon: Icon(Icons.search, color: config.textColor),
                          constraints: BoxConstraints(
                            minWidth: searchBarHeight,
                            minHeight: searchBarHeight,
                          ),
                          padding: EdgeInsets.all(isMobile ? 8.0 : 12.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
