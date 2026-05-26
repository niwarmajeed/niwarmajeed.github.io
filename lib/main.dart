import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/data/resume_data.dart';
import 'src/ui/screens/cv_home_screen.dart';

void main() {
  runApp(const CVWebsite());
}

class CVWebsite extends StatefulWidget {
  const CVWebsite({super.key});

  @override
  State<CVWebsite> createState() => _CVWebsiteState();
}

class _CVWebsiteState extends State<CVWebsite> {
  // شێوازێ نیشاندانی (Light یان Dark)
  ThemeMode _themeMode = ThemeMode.dark; // من ب شێوەیەکێ سەرەکی کرە Dark چونکو جوانترە

  void _toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.system) {
        final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
        _themeMode = brightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
      } else {
        _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      }
    });
  }

  // رێکخستنا رەنگێن Dark (تارێ)
  ThemeData get _darkTheme => ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF00FFC8), 
        scaffoldBackgroundColor: const Color(0xFF0A192F), // نیڤی رەش و شین
        cardColor: const Color(0xFF112240),
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: const Color(0xFF94A3B8), 
          displayColor: const Color(0xFFE2E8F0),
        ),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FFC8), 
          secondary: Color(0xFF64FFDA),
          surface: Color(0xFF112240),
        ),
      );

  // رێکخستنا رەنگێن Light (روهن)
  ThemeData get _lightTheme => ThemeData.light().copyWith(
        primaryColor: const Color(0xFF0891E5),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        cardColor: Colors.white,
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme).apply(
          bodyColor: const Color(0xFF475569),
          displayColor: const Color(0xFF0F172A),
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF0891E5),
          secondary: Color(0xFF0EA5E9),
          surface: Colors.white,
        ),
      );

  @override
  Widget build(BuildContext context) {
    // لادانا خەتایا ناڤی ب رێکا بکارئینانا firstName و lastName
    final fullName = '${ResumeData.profile.firstName} ${ResumeData.profile.lastName}';

    return MaterialApp(
      title: '$fullName | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _themeMode,
      home: Banner(
        message: 'Niwar CV', // من ناڤێ بانەری گوهۆڕی بۆ ناڤێ تە
        location: BannerLocation.topStart,
        color: const Color(0xFF00FFC8),
        textStyle: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        child: SelectionArea( // بۆ هندێ خەلک بشێن نڤیسینان کۆپی بکەن
          child: CVHomePage(
            onThemeToggle: _toggleTheme, 
            currentThemeMode: _themeMode
          ),
        ),
      ),
    );
  }
}