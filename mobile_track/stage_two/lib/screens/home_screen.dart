import 'package:flutter/material.dart';

import '../screens/edit_cv_screen.dart';
import '../widgets/certification.dart';
import '../widgets/education.dart';
import '../widgets/experience.dart';
import '../widgets/language.dart';
import '../widgets/project.dart';
import '../widgets/skill.dart';
import '../widgets/bio.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  void editResumeNavigate(BuildContext context) {
    Navigator.of(context).pushNamed(
      EditResumeScreenCategories.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.grey,
        title: const Text(
          "Mobile CV Application",
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          editResumeNavigate(context);
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                    ],
                  ),
                ),
              ],
              child: const Icon(
                Icons.more_vert,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: const [
          MyBio(),
          MyEducation(),
          SizedBox(height: 8),
          MySkills(),
          SizedBox(height: 8),
          MyWorkExperience(),
          SizedBox(height: 8),
          MyProjects(),
          SizedBox(height: 8),
          MyLanguages(),
          SizedBox(height: 8),
          MyCertifications(),
        ],
      ),
      floatingActionButton: CircleAvatar(
        child: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            editResumeNavigate(context);
          },
        ),
      ),
    );
  }
}
