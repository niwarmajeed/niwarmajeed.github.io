import 'package:cv_website/src/models/skill.dart';
import 'package:cv_website/src/models/skill_section.dart';

class Skills {
  // Mobile Development
  static final flutter = Skill(name: 'Flutter', proficiency: SkillProficiency.expert);
  static final dart = Skill(name: 'Dart', proficiency: SkillProficiency.expert);
  static final crossPlatform = Skill(name: 'Cross-Platform Development', proficiency: SkillProficiency.expert);
  static final mobileDevelopment = Skill(name: 'Mobile Development', proficiency: SkillProficiency.expert);
  static final iosDevelopment = Skill(name: 'iOS Development (Swift)', proficiency: SkillProficiency.intermediate);
  static final androidDevelopment = Skill(name: 'Android Development (Java/Kotlin)', proficiency: SkillProficiency.intermediate);
  static final performanceOptimization = Skill(name: 'Performance Optimization', proficiency: SkillProficiency.advanced);
  static final uiUxDesign = Skill(name: 'UI/UX Design Principles', proficiency: SkillProficiency.advanced);
  static final openSourceDev = Skill(name: 'Open-Source Development', proficiency: SkillProficiency.advanced); // زێدەکرن

  // Tools & Technologies
  static final git = Skill(name: 'Git', proficiency: SkillProficiency.expert);
  static final github = Skill(name: 'GitHub', proficiency: SkillProficiency.expert); // زێدەکرن
  static final firebase = Skill(name: 'Firebase (Auth, Firestore, Cloud Functions)', proficiency: SkillProficiency.advanced);
  static final restApis = Skill(name: 'REST APIs & JSON', proficiency: SkillProficiency.expert);
  static final ciCd = Skill(name: 'CI/CD (GitHub Actions, Codemagic)', proficiency: SkillProficiency.advanced);
  static final vscode = Skill(name: 'VS Code', proficiency: SkillProficiency.expert);
  static final androidStudio = Skill(name: 'Android Studio', proficiency: SkillProficiency.advanced);
  static final xcode = Skill(name: 'Xcode', proficiency: SkillProficiency.intermediate);
  static final aiTools = Skill(name: 'AI-Powered Development (Cursor, Copilot)', proficiency: SkillProficiency.expert);

  // Architecture & State Management
  static final cleanArchitecture = Skill(name: 'Clean Architecture', proficiency: SkillProficiency.expert);
  static final oop = Skill(name: 'Object-Oriented Programming (OOP)', proficiency: SkillProficiency.expert);
  static final bloc = Skill(name: 'BLoC State Management', proficiency: SkillProficiency.expert);
  static final provider = Skill(name: 'Provider', proficiency: SkillProficiency.expert);
  static final riverpod = Skill(name: 'Riverpod', proficiency: SkillProficiency.advanced);
  static final mvvm = Skill(name: 'MVVM Architecture', proficiency: SkillProficiency.advanced);

  // Soft Skills
  static final problemSolving = Skill(name: 'Problem Solving', proficiency: SkillProficiency.expert);
  static final teamCollaboration = Skill(name: 'Team Collaboration', proficiency: SkillProficiency.expert);
  static final agileScrum = Skill(name: 'Agile & Scrum', proficiency: SkillProficiency.advanced);
  static final selfMotivation = Skill(name: 'Self-Motivation & Fast Learning', proficiency: SkillProficiency.expert);

  static final sections = [
    SkillSection(
      category: 'Technical Skills',
      skills: [
        flutter,
        dart,
        crossPlatform,
        mobileDevelopment,
        iosDevelopment,
        androidDevelopment,
        cleanArchitecture,
        bloc,
        provider,
        riverpod,
        mvvm,
        oop,
        git,
        github,
        firebase,
        restApis,
        ciCd,
        uiUxDesign,
        vscode,
        androidStudio,
        xcode,
        aiTools,
        performanceOptimization,
        openSourceDev,
      ],
    ),
    SkillSection(
      category: 'Soft Skills',
      skills: [
        problemSolving,
        teamCollaboration,
        selfMotivation,
        agileScrum,
      ],
    ),
  ];
}