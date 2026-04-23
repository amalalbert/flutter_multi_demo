import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFF2F2F2F),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 28,
        horizontal: isMobile ? 16 : 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🔝 Navigation Links
          _ResponsiveLinks(isMobile: isMobile),

          SizedBox(height: isMobile ? 16 : 24),

          /// 🔽 Copyright
          Align(
            alignment:
                isMobile ? Alignment.center : Alignment.centerRight,
            child: Text(
              "©2026 Funai Soken",
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: isMobile ? 11 : 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Responsive Links Widget
class _ResponsiveLinks extends StatelessWidget {
  final bool isMobile;

  const _ResponsiveLinks({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final items = [
      "会社概要",
      "利用規約",
      "プライバシーポリシー",
      "よくある質問",
    ];

    /// 📱 Mobile → Wrap
    if (isMobile) {
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 16,
        runSpacing: 10,
        children: items
            .map((text) => _FooterLink(text: text))
            .toList(),
      );
    }

    /// 💻 Desktop → Row with dividers
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length * 2 - 1, (index) {
        if (index.isOdd) {
          return _divider();
        }
        final text = items[index ~/ 2];
        return _FooterLink(text: text);
      }),
    );
  }
}

/// 🔹 Individual Link (Clickable + Hover)
class _FooterLink extends StatefulWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          // TODO: handle navigation
          debugPrint("${widget.text} clicked");
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            color: isHovered ? Colors.white : Colors.white70,
            fontSize: 14,
            decoration:
                isHovered ? TextDecoration.underline : TextDecoration.none,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Divider
Widget _divider() {
  return Container(
    width: 1,
    height: 14,
    color: Colors.white24,
    margin: const EdgeInsets.symmetric(horizontal: 12),
  );
}