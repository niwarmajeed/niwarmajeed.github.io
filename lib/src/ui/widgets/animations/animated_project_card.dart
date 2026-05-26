import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:media_source/media_source.dart';
import '../../../models/project.dart';
import '../../../models/media.dart';
import 'fade_in_up_animation.dart';

class AnimatedProjectCard extends StatefulWidget {
  final Duration delay;
  final double width;
  final Project project;
  final double titleFontSize;
  final double descFontSize;
  final VoidCallback? onTap;

  const AnimatedProjectCard({
    super.key,
    required this.delay,
    required this.width,
    required this.project,
    required this.titleFontSize,
    required this.descFontSize,
    this.onTap,
  });

  @override
  State<AnimatedProjectCard> createState() => _AnimatedProjectCardState();
}

class _AnimatedProjectCardState extends State<AnimatedProjectCard> {
  bool _isHovered = false;

  // فانکشنەک بۆ دیارکرنا ئایکۆنێ پڕۆژەی (Store Icons)
  IconData _getMediaIcon(Media media) {
    if (media.media is! UrlMedia) return Iconsax.link_1;
    final url = (media.media as UrlMedia).uri.toString().toLowerCase();

    if (url.contains('play.google.com')) return Icons.play_arrow;
    if (url.contains('apps.apple.com')) return Icons.apple;
    if (url.contains('pub.dev')) return Iconsax.box_1;
    if (url.contains('github.com')) return Iconsax.code;
    return Iconsax.link_1;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return FadeInUpAnimation(
      delay: widget.delay,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: widget.width,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.cardColor,
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
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : [],
            ),
            transform: Matrix4.translationValues(0.0, _isHovered ? -10.0 : 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // لۆجیکێ نیشاندانا لۆگۆی بێ خەتا
                    if (widget.project.logo != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 45, height: 45,
                          color: Colors.white,
                          child: widget.project.logo!.media.fold(
                            asset: (a) => Image.asset(a.assetPath, fit: BoxFit.cover),
                            network: (n) => Image.network(n.uri.toString(), fit: BoxFit.cover),
                            orElse: () => Icon(Icons.folder, color: theme.colorScheme.primary),
                          ),
                        ),
                      )
                    else
                      Icon(Iconsax.folder_open, color: theme.colorScheme.primary, size: 40),
                    
                    if (widget.onTap != null)
                      Icon(Icons.open_in_new, color: theme.colorScheme.primary.withValues(alpha: 0.6), size: 20),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.project.title,
                  style: GoogleFonts.roboto(
                    fontSize: widget.titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.displayLarge?.color,
                  ),
                ),
                const SizedBox(height: 10),
                // نیشاندانا ئایکۆنێن ستۆران (Play Store, App Store...)
                if (widget.project.media.isNotEmpty)
                  Wrap(
                    spacing: 10,
                    children: widget.project.media.map((m) => Icon(_getMediaIcon(m), size: 18, color: theme.colorScheme.primary.withValues(alpha: 0.7))).toList(),
                  ),
                const SizedBox(height: 15),
                Text(
                  widget.project.description,
                  style: GoogleFonts.roboto(
                    fontSize: widget.descFontSize,
                    height: 1.6,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}