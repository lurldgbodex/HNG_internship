import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/education_provider.dart';
import '../models/education.dart';

class EducationEditScreen extends StatefulWidget {
  const EducationEditScreen({super.key});
  static const routeName = '/education-edit';

  @override
  State<EducationEditScreen> createState() => _EducationEditScreenState();
}

class _EducationEditScreenState extends State<EducationEditScreen> {
  @override
  Widget build(BuildContext context) {
    final educationProvider = Provider.of<EducationProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Education"),
        ),
        body: ListView.builder(
          itemCount: educationProvider.education.length,
          itemBuilder: (context, index) {
            final education = educationProvider.education[index];
            return ListTile(
              title: Text('Degree: ${education.degree}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Institution: ${education.school}'),
                  Text('Start: ${education.startDate}'),
                  Text('End: ${education.endDate}'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  // Show the education entry edit form when the edit button is pressed
                  _showEditEducationForm(context, educationProvider, index);
                },
              ),
            );
          },
        ));
  }

  void _showEditEducationForm(
      BuildContext context, EducationProvider educationProvider, int index) {
    final education = educationProvider.education[index];
    final TextEditingController degreeController =
        TextEditingController(text: education.degree);
    final TextEditingController institutionController =
        TextEditingController(text: education.school);
    final TextEditingController startYearController = TextEditingController(
        text: DateFormat.yMMMd().format(education.startDate));
    final TextEditingController endYearController = TextEditingController(
        text: DateFormat.yMMMd().format(education.endDate));
    final TextEditingController gradeController =
        TextEditingController(text: education.grade);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Education Entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: degreeController,
                  decoration: const InputDecoration(labelText: 'Degree'),
                ),
                TextField(
                  controller: institutionController,
                  decoration: const InputDecoration(labelText: 'Institution'),
                ),
                TextField(
                  controller: gradeController,
                  decoration: const InputDecoration(labelText: 'Grade'),
                ),
                TextField(
                  controller: startYearController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(labelText: 'Start Date'),
                ),
                TextField(
                  controller: endYearController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(labelText: 'End Date'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedDegree = degreeController.text;
                final updatedInstitution = institutionController.text;
                final updatedStartYear =
                    DateFormat.yMMMd().parse(startYearController.text);
                final updatedEndYear =
                    DateFormat.yMMMd().parse(endYearController.text);
                final updatedGrade = gradeController.text;

                // Update the education entry with the updated data
                final updatedEducation = Education(
                  degree: updatedDegree,
                  school: updatedInstitution,
                  grade: updatedGrade,
                  startDate: updatedStartYear,
                  endDate: updatedEndYear,
                );
                educationProvider.updateEducation(index, updatedEducation);
                Navigator.of(context).pop();
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
