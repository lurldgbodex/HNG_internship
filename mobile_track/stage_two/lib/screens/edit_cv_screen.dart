import 'package:flutter/material.dart';
import 'package:stage_two/screens/certification_edit.dart';
import 'package:stage_two/screens/edit_skill_screen.dart';
import 'package:stage_two/screens/education_edit.dart';
import 'package:stage_two/screens/experienc_edit.dart';
import 'package:stage_two/screens/language_edit.dart';
import 'package:stage_two/screens/project_edit.dart';

import 'edit_bio_screen.dart';

class EditResumeScreenCategories extends StatelessWidget {
  const EditResumeScreenCategories({super.key});
  static const routeName = '/edit-resume';

  static const List<String> categories = [
    'Bio',
    'Education',
    'Skills',
    'Work Experience',
    'Projects',
    'Languages',
    'Certification'
  ];

  void _navigateToEditScreen(BuildContext context, String category) {
    switch (category) {
      case 'Bio':
        Navigator.of(context).pushNamed(ProfileEditScreen.routeName);
        break;
      case 'Education':
        Navigator.of(context).pushNamed(EducationEditScreen.routeName);
        break;
      case 'Skills':
        Navigator.of(context).pushNamed(EditSkillsScreen.routeName);
        break;
      case 'Work Experience':
        Navigator.of(context).pushNamed(WorkExperienceEditScreen.routeName);
        break;
      case 'Projects':
        Navigator.of(context).pushNamed(ProjectEditScreen.routeName);
        break;
      case 'Languages':
        Navigator.of(context).pushNamed(LanguageEditScreen.routeName);
        break;
      case 'Certification':
        Navigator.of(context).pushNamed(CertificationEditScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit CV',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ...categories.map(
            (e) => ListTile(
              title: Text(
                e,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: TextButton.icon(
                onPressed: () {
                  _navigateToEditScreen(context, e);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.grey,
                ),
                label: Text(
                  'edit',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
