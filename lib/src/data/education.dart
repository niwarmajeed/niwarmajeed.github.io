import 'skills.dart';
import '../models/date_range.dart';
import '../models/education.dart';

class EducationSchools {
  static final values = [
    // باوەرنامەیا زانکۆیێ
    Education(
      schoolName: 'University of Duhok',
      degreeName: 'Bachelor of Science (B.Sc.)',
      fieldOfStudy: 'Computer Science / IT',
      dateRange: DateRange(start: DateTime(2016), end: DateTime(2020)),
      description:
          'Studied core computer science concepts including Algorithms, Data Structures, and Software Engineering.',
      skills: [
        Skills.oop,
        Skills.problemSolving,
        Skills.git,
      ],
    ),

    // خول و فێربوونا ئۆنلاین
    Education(
      schoolName: 'Self-Taught & Online Certifications',
      degreeName: 'Specialized Training',
      fieldOfStudy: 'Mobile Application Development',
      dateRange: DateRange(start: DateTime(2020), end: DateTime(2021)),
      description:
          'Completed various professional courses on Flutter, Dart, and Firebase through platforms like Udemy and Coursera.',
      skills: [
        Skills.flutter,
        Skills.dart,
        Skills.firebase,
        Skills.cleanArchitecture,
      ],
    ),
  ];
}
