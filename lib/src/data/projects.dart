// ignore: unused_import
import 'package:cv_website/src/data/experiences.dart';
import 'package:cv_website/src/data/skills.dart';
import 'package:cv_website/src/models/media.dart';
import 'package:cv_website/src/models/project.dart';
import 'package:media_source/media_source.dart';

class Projects {
  static final values = [
    // پڕۆژێ ١: خزینا دوسکی
    Project(
      title: 'خزینا دوسکی (Xzina Duski)',
      description:
          'ئەڤ بەڕنامە تایبەتە ب بەرهەمێن مامۆستا تەحسین ئیبراهیم دوسکی ڤە ب هێڤی یا وێ چەندێ ببیتە خزینەک ژبو حەژێکر و گوهدار و خواندەوایێن بەرهەمێن وی. پتر ژ ٥٩٠ ڤیدیۆ و ١٠٠ پەرتووکێن PDF و پەرتووکێن دەنگی د ناڤدا هەنە. ئەڤ بەڕنامە ب تەکنۆلۆژیایا Flutter هاتیە دروستکرن.',
      logo: Media(
        media: ImageNetworkMedia.url('https://i.imgur.com/bp3BNZd.png'),
        title: 'icon.png',
        type: MediaType.image,
      ),
      media: [
        Media.googlePlayStore(
            'https://play.google.com/store/apps/details?id=com.xzina.pertukenduski'),
        Media.link(
            'https://apkpure.net/ar/%D8%AE%D8%B2%DB%8C%D9%86%D8%A7-%D8%AF%D9%88%D8%B3%DA%A9%DB%8C/com.xzina.pertukenduski',
            title: 'APK Pure'),
      ],
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.firebase,
        Skills.cleanArchitecture,
        Skills.git,
      ],
      experiences: [], // ئەگەر تە ل کۆمپانیەکێ کار نەکربی بۆ ڤی پڕۆژەی بلا یا تال بیت
    ),

    // پڕۆژێ ٢: په رتووكخانا دايك
    Project(
      title: 'پەرتووکخانا دایک (Daik Library)',
      description:
          'ئەڤ پڕۆژە خزمەتەکا مەزن پێشکێشی جڤاکێ مە یێ موسڵمان دکەت ب رێکا کۆمکرنا پەرتووکێن ئایینی، حەدیس و قورئانێ و بابەتێن هزری. ئارمانجا مە لێرە خزمەتکرنا مرۆڤایەتیێ و پاراستنا بەرهەمێن نڤیسەرانە ب شێوەیەکێ دیجیتاڵی.',
      logo: Media(
        media: ImageNetworkMedia.url('https://i.imgur.com/TMtDb6m.png'),
        title: 'icon.png',
        type: MediaType.image,
      ),
      media: [
        Media.googlePlayStore(
            'https://play.google.com/store/apps/details?id=partok.xanadaik'),
        Media.link(
            'https://apkpure.net/ar/%D9%BE%D9%87-%D8%B1%D8%AA%D9%88%D9%88%D9%83%D8%AE%D8%A7%D9%86%D8%A7-%D8%AF%D8%A7%D9%8A%D9%83/partok.xanadaik/download',
            title: 'APK Pure'),
      ],
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.restApis,
        Skills.uiUxDesign,
      ],
      experiences: [],
    ),

    // پڕۆژێ3 : بـــەریکانا پــێزانیـنان

    Project(
      title: 'بـــەریکانا پــێزانیـنان (Berikana Pezaninan)',
      description:
          ' ئەپلیکەیشنا بـــەریکانا پــێزانیـنان من دورستکر کەمە دریاری بو رحا دەیکا خو یا خوشتڤی . ئەڤ بەرنامە بو وێ مەرەمێ هاتیە دورستکرن زانیارین خو زێدە بکەین ب پرسیاریارێن جورەوجورڤە. هیڤیدارم بیتە جهێ مفای بو هەوە یێن هێژا. ',
      logo: Media(
        media: ImageNetworkMedia.url('https://i.imgur.com/AmbcpTI.png'),
        title: 'icon.png',
        type: MediaType.image,
      ),
      media: [
        Media.googlePlayStore(
            'https://play.google.com/store/apps/details?id=com.Niwar.barekana'),
        Media.link(
            'https://apkpure.net/ar/%D8%A8%D9%80%D9%80%D9%80%DB%95%D8%B1%DB%8C%DA%A9%D8%A7%D9%86%D8%A7-%D9%BE%D9%80%D9%80%DB%8E%D8%B2%D8%A7%D9%86%DB%8C%D9%80%D9%86%D8%A7%D9%86/com.Niwar.barekana',
            title: 'APK Pure'),
      ],
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.restApis,
        Skills.uiUxDesign,
      ],
      experiences: [],
    ),

    // پڕۆژێ4 : حه‌دیسێن بادینى

    Project(
      title: ' حه‌دیسێن بادینى (Hadisen Badini)',
      description:
          ' دەربارەی ئەپلیکەیشنێ ئەپلیکەیشنا حه‌دیسێن بادینى ب زمانێ کوردی یێ شرین هاتيه دروستکرن ژبۆ وێ یەکێ کو تاکێ کوردێ موسلمان مفایی ژێ وەربگریت ، و دڤی ئەپلیکەیشنا حه‌دیسێن بادینى دا حه‌دیس ب شێوەیەکێ دروست هاتە شلوڤەکرن و نیشاندان ل دویف رێبازا قورئانا پیرۆز و سوننەتا پێغەمبەرێ خوشتڤی محمد (ﷺ) و ب تێگەهشتنا صەحابی و پێشینێن ئوممەتێ. ',
      logo: Media(
        media: ImageNetworkMedia.url('https://i.imgur.com/NWIRq6L.png'),
        title: 'icon.png',
        type: MediaType.image,
      ),
      media: [
        Media.googlePlayStore(
            'https://play.google.com/store/apps/details?id=com.hadis.badeni'),
        Media.link(
            'https://apkpure.net/ar/%D8%AD%D9%87%E2%80%8C%D8%AF%DB%8C%D8%B3%DB%8E%D9%86-%D8%A8%D8%A7%D8%AF%DB%8C%D9%86%D9%89/com.hadis.badeni',
            title: 'APK Pure'),
      ],
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.restApis,
        Skills.uiUxDesign,
      ],
      experiences: [],
    ),

// پڕۆژێ5 : بـه‌رنـامێ تێـبينـيان

    Project(
      title: ' notes kurd 95 (Notes Kurd 95)',
      description:
          ' بـه‌رنـامێ تێـبينـيان مـن چێـكر خـزمه‌ته‌كـا بچيك بو خه لكِ داهـاتي دا دێ پتــر شـول تێــدا كـه‌ين بشێـن (ێرجنێ به‌رنامێ تێبينى 2.0)',
      logo: Media(
        media: ImageNetworkMedia.url('https://i.imgur.com/pCOw80L.png'),
        title: 'icon.png',
        type: MediaType.image,
      ),
      media: [
        Media.googlePlayStore(
            'https://play.google.com/store/apps/details?id=com.kurdi.notes'),
        Media.link('https://apkpure.net/ar/notes-kurd-95/com.kurdi.notes',
            title: 'APK Pure'),
      ],
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.restApis,
        Skills.uiUxDesign,
      ],
      experiences: [],
    ),

    // پڕۆژێ ٣: پۆرتفۆلیۆیا شەخسی (ئەو مالپەرێ تو نوکە چێدکەی)
    Project(
      title: 'Niwar Majeed Portfolio',
      description:
          'مالپەرێ شەخسی یێ مۆدێرن کو ب تەکنۆلۆژیایا Flutter Web هاتیە دروستکرن بۆ نیشاندانا کار و لێهاتی و شارەزاییان. ئەڤ مالپەرە یێ Responsiveە و ل سەر هەمی ئامیران ب جوانی کار دکەت.',
      media: [
        Media.github(
            'https://github.com/niwar-majeed/portfolio'), // لینکا گیت هاب دانیە
      ],
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.uiUxDesign,
        Skills.git,
      ],
      experiences: [],
    ),
  ];
}
