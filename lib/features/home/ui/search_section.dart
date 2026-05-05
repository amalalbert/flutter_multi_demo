import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:flutter_svg/svg.dart';
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
                  decoration: TextDecoration.none,
                ),
              ),

              SizedBox(height: titleGap),

              /// Search Bar
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: searchBarMaxWidth),
                  child: Material(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {}, // 👈 required
                      borderRadius: BorderRadius.circular(8),
                      child: Ink(
                        height: searchBarHeight,
                        padding: EdgeInsets.symmetric(
                          horizontal: searchBarPadding,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: config.onSearchInputChanged,
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

                            IconButton(
                              onPressed: config.onSearchPressed ?? () {},
                              iconSize: iconSize,
                              icon: SvgPicture.asset(
                                'assets/images/search.svg',
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(config.textColor, BlendMode.srcIn),
                              ),
                            ),
                          ],
                        ),
                      ),
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