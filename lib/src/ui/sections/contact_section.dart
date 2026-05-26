import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/resume_data.dart';
import '../../utils/responsive_utils.dart';
import '../widgets/animations/fade_in_up_animation.dart';
import '../widgets/common/animated_buttons.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;

  const ContactSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final contact = ResumeData.profile.contact;
    final isMobile = ResponsiveUtils.isMobile(context);
    final theme = Theme.of(context);

    return Container(
      key: sectionKey,
      padding: ResponsiveUtils.getResponsivePadding(context).copyWith(
        top: isMobile ? 60 : 100,
        bottom: isMobile ? 60 : 100,
      ),
      color: theme.scaffoldBackgroundColor, 
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUpAnimation(
                child: Column(
                  children: [
                    Text(
                      'Get In Touch',
                      style: GoogleFonts.roboto(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(context, 48),
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.displayLarge?.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Container(height: 3, width: 60, color: theme.colorScheme.primary),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              FadeInUpAnimation(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  'I\'m currently looking for new opportunities and collaborations. Feel free to reach out to me through any of my social networks!',
                  style: GoogleFonts.roboto(
                    fontSize: 18, height: 1.6,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              // لێرە مە دوکمەیا ئیمەیلێ لادان و بتنێ ئایكۆنان مە هێلان
              FadeInUpAnimation(
                delay: const Duration(milliseconds: 400),
                child: Wrap(
                  spacing: 15, runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    if (contact.linkedinUrl != null)
                      AnimatedSocialIcon(icon: Icons.link, onTap: () => _launchURL(contact.linkedinUrl!)),
                    if (contact.githubUrl != null)
                      AnimatedSocialIcon(icon: Icons.code, onTap: () => _launchURL(contact.githubUrl!)),
                    if (contact.instagramUrl != null)
                      AnimatedSocialIcon(icon: Icons.camera_alt_outlined, onTap: () => _launchURL(contact.instagramUrl!)),
                    if (contact.telegramUrl != null)
                      AnimatedSocialIcon(icon: Icons.send_rounded, onTap: () => _launchURL(contact.telegramUrl!)),
                    if (contact.whatsappUrl != null)
                      AnimatedSocialIcon(icon: Icons.chat_bubble_outline, onTap: () => _launchURL(contact.whatsappUrl!)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) debugPrint('Could not launch $url');
  }
}