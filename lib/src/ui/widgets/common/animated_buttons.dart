import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// دوکمەیەکا لڤ لڤۆک بۆ ناڤیگەیشنێ (NavBar)
class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AnimatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: TextButton(
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }
}

/// ئایکۆن-دوکمەیا لڤ لڤۆک (وەک گوهۆڕینا تمی)
class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final double? size;
  final Color? color;
  final String? tooltip;

  const AnimatedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size,
    this.color,
    this.tooltip,
  });

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: IconButton(
            onPressed: widget.onPressed,
            icon: Icon(widget.icon),
            color: widget.color ?? theme.textTheme.bodyMedium?.color,
            iconSize: widget.size,
            tooltip: widget.tooltip,
          ),
        ),
      ),
    );
  }
}

/// ئایکۆنێن سۆشیاڵ میدیایێ (LinkedIn, GitHub) ب ستایلەکێ جوان
class AnimatedSocialIcon extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AnimatedSocialIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  State<AnimatedSocialIcon> createState() => _AnimatedSocialIconState();
}

class _AnimatedSocialIconState extends State<AnimatedSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: GestureDetector(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.all(isMobile ? 12 : 14),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1A2744) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isHovered
                      ? theme.colorScheme.primary
                      : (isDark ? const Color(0xFF233554) : const Color(0xFFE2E8F0)),
                  width: 1.5,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(alpha: 0.5),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                widget.icon,
                color: _isHovered ? theme.colorScheme.primary : theme.textTheme.bodyLarge?.color,
                size: isMobile ? 22 : 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// دوکمەیا CTA یا مەزن و رەنگاوڕەنگ (وەک View Projects)
class AnimatedCTAButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final bool isMobile;

  const AnimatedCTAButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isPrimary,
    required this.isMobile,
  });

  @override
  State<AnimatedCTAButton> createState() => _AnimatedCTAButtonState();
}

class _AnimatedCTAButtonState extends State<AnimatedCTAButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 24 : 32,
              vertical: widget.isMobile ? 14 : 18,
            ),
            decoration: BoxDecoration(
              gradient: widget.isPrimary
                  ? LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF5A9FFF), const Color(0xFF64FFDA)]
                          : [const Color(0xFF0EA5E9), const Color(0xFF06B6D4)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                  : null,
              borderRadius: BorderRadius.circular(50),
              border: widget.isPrimary
                  ? null
                  : Border.all(
                      color: _isHovered ? theme.colorScheme.primary : (theme.textTheme.bodyMedium?.color ?? Colors.grey),
                      width: 2,
                    ),
              boxShadow: _isHovered && widget.isPrimary
                  ? [
                      BoxShadow(
                        color: (isDark ? const Color(0xFF64FFDA) : const Color(0xFF0EA5E9)).withValues(alpha: 0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.text,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: widget.isPrimary
                        ? Colors.white
                        : (_isHovered ? theme.colorScheme.primary : theme.textTheme.displayLarge?.color),
                  ),
                ),
                if (widget.isPrimary) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward_rounded, size: 18, color: Colors.white),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}