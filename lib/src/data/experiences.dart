import 'package:cv_website/src/data/skills.dart';
import 'package:cv_website/src/models/company.dart';
import 'package:cv_website/src/models/date_range.dart';
import 'package:cv_website/src/models/experience.dart';
import 'package:media_source/media_source.dart';

class Experiences {
  // ئەزموونا ئێکێ: کارێ سەربەخۆ (Freelance)
  static final freelanceDev = Experience(
    title: 'Freelance Mobile App Developer',
    locationType: 'Remote / Kurdistan',
    employmentType: 'Self-Employed',
    dateRange: DateRange(start: DateTime(2021, 01)), 
    description:
        '• Designed and developed multiple Android/iOS applications using Flutter and Dart.\n'
        '• Published and maintained apps on Google Play Store and other platforms.\n'
        '• Implemented Firebase for authentication, database, and push notifications.\n'
        '• Focused on building apps for the Kurdish community, ensuring high performance and localized UI.',
    skills: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
      Skills.git,
      Skills.restApis,
      Skills.uiUxDesign,
      Skills.problemSolving,
      Skills.performanceOptimization, // ل جهێ debugging من ئەڤە دانا
    ],
  );
  
  // ئەزموونا دووێ: پەرەپێدەرێ سەربەخۆ یێ سیستەمی
  static final independentProjectDev = Experience(
    title: 'Mobile & Web Solutions Developer',
    locationType: 'Remote',
    employmentType: 'Independent Contractor',
    dateRange: DateRange(start: DateTime(2023, 05)),
    description:
        '• Working on building scalable mobile solutions using Clean Architecture.\n'
        '• Collaborating with clients to transform ideas into functional mobile applications.\n'
        '• Experienced in API integration and State Management (BLoC, Provider).',
    skills: [
      Skills.cleanArchitecture,
      Skills.bloc,
      Skills.provider,
      Skills.restApis,
      Skills.aiTools,
      Skills.selfMotivation,
    ],
  );

  // لیستا کۆمپانیان بۆ نیشاندان د مالپەری دا
  static final values = [
    Company(
      name: 'Freelance / Self-Employed',
      location: 'Duhok, Kurdistan',
      logo: ImageAssetMedia(
        assetPath: 'assets/photo.jpg', 
        mimeType: 'image/jpeg',
        name: 'freelance.jpg',
        size: 100.kb,
      ),
      experiences: [freelanceDev, independentProjectDev],
    ),
  ];
}