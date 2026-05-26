import 'dart:math' show cos, sin;
import 'package:flutter/material.dart';

/// بازنەیا لڤ لڤۆک و رەنگاوڕەنگا دەوروبەرێ وێنەی
class AnimatedGradientBorder extends StatefulWidget {
  final double size;

  const AnimatedGradientBorder({super.key, required this.size});

  @override
  State<AnimatedGradientBorder> createState() => _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<AnimatedGradientBorder> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4), // کێمەکێ من هێدی تر کر دا نەرمتر بیت
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary( // بۆ نەهێلانا جەمدینێ
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: widget.size * 1.15,
            height: widget.size * 1.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: const [
                  Color(0xFF00FFC8),
                  Color(0xFF00E5FF),
                  Color(0xFF7C4DFF),
                  Color(0xFFFF4081),
                  Color(0xFF00FFC8),
                ],
                transform: GradientRotation(_controller.value * 6.28),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00FFC8).withValues(alpha: 0.5),
                  blurRadius: 40,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: const Color(0xFF7C4DFF).withValues(alpha: 0.4),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// ئایکۆنێن لڤ لڤۆک یێن دەوروبەرێ وێنەی (Apple, Android, Flutter, Code)
class FloatingIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final double angle;
  final double radius;

  const FloatingIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.angle,
    required this.radius,
  });

  @override
  State<FloatingIcon> createState() => _FloatingIconState();
}

class _FloatingIconState extends State<FloatingIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // لڤینا بازنەیی یا ئایکۆنان
          final animatedAngle = widget.angle + (_controller.value * 0.15);
          // لڤینا سەر و خوار (Hover effect)
          final hoverOffset = _controller.value * 8.0;

          return Transform.translate(
            offset: Offset(
              widget.radius * cos(animatedAngle),
              widget.radius * sin(animatedAngle) + hoverOffset,
            ),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1A2744) : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isDark ? const Color(0xFF233554) : const Color(0xFFE2E8F0),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.3),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                color: widget.color,
                size: 22,
              ),
            ),
          );
        },
      ),
    );
  }
}

/// نیشاندەرێ لێدانێ (Cursor) بۆ نڤیسینا لڤ لڤۆک
class BlinkingCursor extends StatefulWidget {
  final double fontSize;

  const BlinkingCursor({super.key, required this.fontSize});

  @override
  State<BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<BlinkingCursor> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FadeTransition(
      opacity: _controller,
      child: Text(
        '|', // من گوهۆڕی بۆ هێلەکا ستوونی چونکو جوانترە
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }
}