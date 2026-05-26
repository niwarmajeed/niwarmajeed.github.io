import 'package:flutter/material.dart';

class FadeInUpAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;

  const FadeInUpAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<FadeInUpAnimation> createState() => _FadeInUpAnimationState();
}

class _FadeInUpAnimationState extends State<FadeInUpAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800), // کێمەکێ من درێژتر کر دا نەرمتر بیت
      vsync: this,
    );

    // من Curve گوهۆڕی بۆ easeOutCubic دا لڤین یا سروشتی تر بیت
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _offset = Tween<Offset>(
      begin: const Offset(0, 0.2), // لڤین کێمەکێ پتر ژ خوارێ بۆ سەرێ
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary( // بۆ هندێ خێراییا مالپەری پاراستی بیت
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _offset,
          child: widget.child,
        ),
      ),
    );
  }
}