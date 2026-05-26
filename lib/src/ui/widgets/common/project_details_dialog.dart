import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:media_source/media_source.dart';
import '../../../models/project.dart';
import '../../../models/media.dart';
import '../../../utils/responsive_utils.dart';

class ProjectDetailsDialog extends StatelessWidget {
  final Project project;

  const ProjectDetailsDialog({
    super.key,
    required this.project,
  });

  // دیارکرنا ئایکۆنێن دروست بۆ ستۆر و لینکێن جودا
  IconData _getMediaIcon(Media media) {
    if (media.media is! UrlMedia) return Iconsax.link_1;
    final url = (media.media as UrlMedia).uri.toString().toLowerCase();

    if (url.contains('play.google.com')) return Icons.play_arrow;
    if (url.contains('apps.apple.com')) return Icons.apple;
    if (url.contains('pub.dev')) return Iconsax.box_1;
    if (url.contains('github.com')) return Iconsax.code;
    return Iconsax.link_1;
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) debugPrint('Could not launch $url');
  }

  // نیشاندانا وێنەی ب قەبارەکێ مەزن
  void _showFullImage(BuildContext context, Media logo) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black.withValues(alpha: 0.9),
        insetPadding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            InteractiveViewer(
              child: Center(
                child: logo.media.fold(
                  asset: (a) => Image.asset(a.assetPath, fit: BoxFit.contain),
                  network: (n) => Image.network(n.uri.toString(), fit: BoxFit.contain),
                  orElse: () => const SizedBox(),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final maxWidth = isMobile ? double.infinity : (isTablet ? 600.0 : 800.0);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: MediaQuery.sizeOf(context).height * 0.85),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark ? const Color(0xFF233554) : const Color(0xFFE2E8F0),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // سەرێ پەنجەرێ (Header)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  if (project.logo != null)
                    GestureDetector(
                      onTap: () => _showFullImage(context, project.logo!),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 45, height: 45, color: Colors.white,
                          child: project.logo!.media.fold(
                            asset: (a) => Image.asset(a.assetPath, fit: BoxFit.cover),
                            network: (n) => Image.network(n.uri.toString(), fit: BoxFit.cover),
                            orElse: () => Icon(Icons.image, color: theme.colorScheme.primary),
                          ),
                        ),
                      ),
                    )
                  else
                    Icon(Iconsax.folder_open, color: theme.colorScheme.primary, size: 40),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      project.title,
                      style: GoogleFonts.roboto(
                        fontSize: 22, fontWeight: FontWeight.bold,
                        color: theme.textTheme.displayLarge?.color,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            // ناڤەرۆکا پەنجەرێ (Content)
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.description,
                      style: GoogleFonts.roboto(
                        fontSize: 16, height: 1.7,
                        color: theme.textTheme.bodyMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    // لینکێن بەردەست (App Store, Play Store...)
                    if (project.media.isNotEmpty) ...[
                      _buildSubTitle(theme, 'Available On'),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10, runSpacing: 10,
                        children: project.media.map((media) {
                          return InkWell(
                            onTap: () {
                              if (media.media is UrlMedia) {
                                _launchURL((media.media as UrlMedia).uri.toString());
                              }
                            },
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              decoration: BoxDecoration(
                                color: theme.cardColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(_getMediaIcon(media), size: 18, color: theme.colorScheme.primary),
                                  const SizedBox(width: 8),
                                  Text(media.title, style: const TextStyle(fontSize: 14)),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 30),
                    ],

                    // لێهاتی و تەکنۆلۆژیا (Skills)
                    if (project.skills.isNotEmpty) ...[
                      _buildSubTitle(theme, 'Technologies Used'),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8, runSpacing: 8,
                        children: project.skills.map((skill) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3)),
                            ),
                            child: Text(
                              skill.name,
                              style: GoogleFonts.firaCode(fontSize: 12, color: theme.colorScheme.primary, fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubTitle(ThemeData theme, String title) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: 18, fontWeight: FontWeight.bold,
        color: theme.textTheme.displayLarge?.color,
      ),
    );
  }
}