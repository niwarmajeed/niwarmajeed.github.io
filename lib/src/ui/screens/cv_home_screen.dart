import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:iconsax/iconsax.dart';
import '../../data/resume_data.dart';
import '../sections/skills_section.dart';
import '../sections/experience_section.dart';
import '../sections/projects_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';
import '../sections/summary_section.dart';
import '../sections/education_section.dart';
import '../widgets/animations/fade_in_up_animation.dart';
import '../widgets/common/profile_widgets.dart';
import '../widgets/common/animated_buttons.dart';

class CVHomePage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const CVHomePage({super.key, required this.onThemeToggle, required this.currentThemeMode});

  @override
  State<CVHomePage> createState() => _CVHomePageState();
}

class _CVHomePageState extends State<CVHomePage> {
  // کلیلێن پێدڤی بۆ ناڤیگەیشنێ
  static final GlobalKey aboutKey = GlobalKey();
  static final GlobalKey experienceKey = GlobalKey();
  static final GlobalKey educationKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey contactKey = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // فانکشنەک بۆ چوونا سەر هەر پشکەکێ ب شێوەیەکێ نەرم
  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context, 
        duration: const Duration(milliseconds: 800), 
        curve: Curves.easeInOut
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      // ئەگەر مۆبایل بیت بارێ سەرێ یێ شەفاف بیت
      appBar: isMobile 
          ? AppBar(backgroundColor: Colors.transparent, elevation: 0) 
          : _buildDesktopAppBar(theme),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _buildHeader(context),
            SummarySection(sectionKey: aboutKey),
            const SkillsSection(),
            ExperienceSection(sectionKey: experienceKey),
            EducationSection(sectionKey: educationKey), 
            ProjectsSection(sectionKey: projectsKey),
            ContactSection(sectionKey: contactKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  PreferredSize _buildDesktopAppBar(ThemeData theme) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        color: theme.scaffoldBackgroundColor.withValues(alpha: 0.9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '<${ResumeData.profile.firstName}/>', 
              style: GoogleFonts.firaCode(
                color: theme.colorScheme.primary, 
                fontSize: 20, 
                fontWeight: FontWeight.bold
              )
            ),
            Row(
              children: [
                _navBarItem('About', () => _scrollToSection(aboutKey)),
                _navBarItem('Experience', () => _scrollToSection(experienceKey)),
                _navBarItem('Education', () => _scrollToSection(educationKey)), 
                _navBarItem('Projects', () => _scrollToSection(projectsKey)),
                _navBarItem('Contact', () => _scrollToSection(contactKey)),
                const SizedBox(width: 20),
                IconButton(
                  icon: Icon(widget.currentThemeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
                  onPressed: widget.onThemeToggle,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBarItem(String title, VoidCallback onTap) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onTap, 
        child: Text(
          title, 
          style: GoogleFonts.firaCode(
            color: theme.textTheme.displayLarge?.color, 
            fontSize: 14
          )
        )
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: isMobile ? null : MediaQuery.sizeOf(context).height * 0.95,
      padding: isMobile ? const EdgeInsets.symmetric(vertical: 60) : null,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark 
              ? [const Color(0xFF0A192F), const Color(0xFF1A2744)] 
              : [const Color(0xFFE0F2FE), const Color(0xFFF5F7FA)],
          begin: Alignment.topLeft, 
          end: Alignment.bottomRight,
        ),
      ),
      child: RepaintBoundary(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
              child: isMobile ? _buildMobileHeroContent(context) : _buildDesktopHeroContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopHeroContent(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInUpAnimation(
                delay: const Duration(milliseconds: 200), 
                child: Text('Hello, I\'m', style: TextStyle(fontSize: 28, color: theme.colorScheme.primary))
              ),
              const SizedBox(height: 20),
              FadeInUpAnimation(
                delay: const Duration(milliseconds: 400), 
                child: Text(ResumeData.profile.firstName, style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold))
              ),
              const SizedBox(height: 20),
              FadeInUpAnimation(
                delay: const Duration(milliseconds: 600), 
                child: _buildAnimatedTitle(context, 32)
              ),
              const SizedBox(height: 40),
              FadeInUpAnimation(
                delay: const Duration(milliseconds: 800), 
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 500), 
                  child: Text(ResumeData.profile.subtitle, style: const TextStyle(fontSize: 18, height: 1.6))
                )
              ),
              const SizedBox(height: 50),
              _buildSocialIcons(context),
              const SizedBox(height: 40),
              AnimatedCTAButton(text: 'View Projects', onPressed: () => _scrollToSection(projectsKey), isPrimary: true, isMobile: false),
            ],
          ),
        ),
        Expanded(flex: 4, child: _buildAnimatedProfileImage(width * 0.2)),
      ],
    );
  }

  Widget _buildMobileHeroContent(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        _buildAnimatedProfileImage(MediaQuery.sizeOf(context).width * 0.4),
        const SizedBox(height: 40),
        Text('Hello, I\'m', style: TextStyle(fontSize: 24, color: theme.colorScheme.primary)),
        Text(ResumeData.profile.firstName, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        _buildAnimatedTitle(context, 24),
        const SizedBox(height: 40),
        _buildSocialIcons(context),
      ],
    );
  }

  Widget _buildAnimatedProfileImage(double size) {
    return RepaintBoundary(
      child: SizedBox(
        width: size * 1.5, height: size * 1.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedGradientBorder(size: size),
            Container(
              width: size, height: size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/photo.jpg'), fit: BoxFit.cover),
              ),
            ),
            ..._buildFloatingTechIcons(size),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFloatingTechIcons(double profileSize) {
    final icons = [
      {'icon': Icons.phone_iphone, 'angle': 0.0, 'color': Colors.cyanAccent},
      {'icon': Icons.android, 'angle': 1.57, 'color': Colors.greenAccent},
      {'icon': Icons.apple, 'angle': 3.14, 'color': Colors.white70},
      {'icon': Icons.code_rounded, 'angle': 4.71, 'color': Colors.orangeAccent}
    ];
    return icons.map((data) => FloatingIcon(icon: data['icon'] as IconData, color: data['color'] as Color, angle: data['angle'] as double, radius: profileSize * 0.75)).toList();
  }

  Widget _buildAnimatedTitle(BuildContext context, double fontSize) {
    final theme = Theme.of(context);
    return AnimatedTextKit(
      animatedTexts: ResumeData.profile.focusList.map((focus) => TypewriterAnimatedText(focus, textStyle: TextStyle(fontSize: fontSize, color: theme.colorScheme.primary), speed: const Duration(milliseconds: 100))).toList(),
      repeatForever: true,
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    final contact = ResumeData.profile.contact;
    return Wrap(
      spacing: 10, runSpacing: 10,
      alignment: WrapAlignment.center,
      children: [
        if (contact.linkedinUrl != null)
          AnimatedSocialIcon(icon: Iconsax.link_circle, onTap: () => _launchURL(contact.linkedinUrl!)),
        if (contact.githubUrl != null)
          AnimatedSocialIcon(icon: Iconsax.code, onTap: () => _launchURL(contact.githubUrl!)),
        if (contact.instagramUrl != null)
          AnimatedSocialIcon(icon: Iconsax.instagram, onTap: () => _launchURL(contact.instagramUrl!)),
        if (contact.facebookUrl != null)
          AnimatedSocialIcon(icon: Icons.facebook, onTap: () => _launchURL(contact.facebookUrl!)),
        if (contact.telegramUrl != null)
          AnimatedSocialIcon(icon: Icons.send_rounded, onTap: () => _launchURL(contact.telegramUrl!)),
        if (contact.snapchatUrl != null)
          AnimatedSocialIcon(icon: Icons.snapchat, onTap: () => _launchURL(contact.snapchatUrl!)),
        if (contact.whatsappUrl != null)
          AnimatedSocialIcon(icon: Icons.chat_bubble_outline_rounded, onTap: () => _launchURL(contact.whatsappUrl!)),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) debugPrint('Could not launch $url');
  }
}