import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ئامرازێن رێکخستنا قەبارەیێ مالپەری بۆ مۆبایل و تابلێت و کۆمپیوتەری
class ResponsiveUtils {
  const ResponsiveUtils._();

  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= 600 && width < 1024;
  }

  static double getMaxContentWidth(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return width;
    if (width < 1024) return 900;
    if (width < 1440) return 1000;
    return 1200;
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(20);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(30);
    }
    return const EdgeInsets.all(50);
  }

  static double getResponsiveFontSize(BuildContext context, double base) {
    if (isMobile(context)) {
      return base * 0.75; // کێمەکێ من مەزنتر کر دا باشتر بهێتە خواندن
    } else if (isTablet(context)) {
      return base * 0.85;
    }
    return base;
  }
}

/// وێجێتێ سەردێرێ پشکێن مالپەری (وەک About Me, Projects...)
class SectionHeader extends StatelessWidget {
  final String title;
  final double fontSize;

  const SectionHeader({
    super.key,
    required this.title,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.roboto( // من فۆنتێ رۆبۆتۆ بکارئینا دا جوانتر بیت
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: theme.textTheme.displayLarge?.color,
          ),
        ),
        const SizedBox(width: 20),
        // ئەو هێلا درێژ یا ل تەنشت نڤیسینێ
        Expanded(
          child: Container(
            height: 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark 
                  ? [theme.colorScheme.primary.withValues(alpha: 0.5), Colors.transparent]
                  : [const Color(0xFFE2E8F0), Colors.transparent],
              ),
            ),
          ),
        ),
      ],
    );
  }
}