import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/certification_provider.dart';
import '../providers/education_provider.dart';
import '../providers/experience_provider.dart';
import '../providers/language_provider.dart';
import '../providers/project_provider.dart';
import '../providers/skill_provider.dart';
import '../screens/certification_edit.dart';
import '../screens/edit_skill_screen.dart';
import '../screens/education_edit.dart';
import '../screens/experienc_edit.dart';
import '../screens/language_edit.dart';
import '../screens/project_edit.dart';
import '../providers/profile_provider.dart';
import '../screens/edit_bio_screen.dart';
import '../screens/edit_cv_screen.dart';
import '../screens/github_screen.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => CertificationProvider()),
        ChangeNotifierProvider(create: (context) => EducationProvider()),
        ChangeNotifierProvider(create: (context) => WorkExperienceProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        ChangeNotifierProvider(create: (context) => SkillProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          primary: Colors.redAccent,
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 137, 137),
          ),
          titleMedium: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
          titleSmall: const TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          bodyLarge: TextStyle(
            color: ColorScheme.fromSwatch().tertiary,
            fontSize: 20,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreenPage(),
      routes: {
        MyGithubScreen.route: (context) => const MyGithubScreen(),
        EditResumeScreenCategories.routeName: (context) =>
            const EditResumeScreenCategories(),
        ProfileEditScreen.routeName: (context) => ProfileEditScreen(),
        EditSkillsScreen.routeName: (context) => const EditSkillsScreen(),
        EducationEditScreen.routeName: (context) => const EducationEditScreen(),
        WorkExperienceEditScreen.routeName: (context) =>
            const WorkExperienceEditScreen(),
        ProjectEditScreen.routeName: (context) => const ProjectEditScreen(),
        LanguageEditScreen.routeName: (context) => const LanguageEditScreen(),
        CertificationEditScreen.routeName: (context) =>
            const CertificationEditScreen(),
      },
    );
  }
}
