import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/experience_provider.dart';
import '../models/work_experience.dart';

class WorkExperienceEditScreen extends StatefulWidget {
  const WorkExperienceEditScreen({super.key});
  static const routeName = '/work-experience-edit';

  @override
  State<WorkExperienceEditScreen> createState() =>
      _WorkExperienceEditScreenState();
}

class _WorkExperienceEditScreenState extends State<WorkExperienceEditScreen> {
  @override
  Widget build(BuildContext context) {
    final workExperienceProvider = Provider.of<WorkExperienceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Work Experience'),
      ),
      body: ListView.builder(
        itemCount: workExperienceProvider.experience.length,
        itemBuilder: (context, index) {
          final workExperience = workExperienceProvider.experience[index];
          return ListTile(
            title: Text('Position: ${workExperience.position}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Company: ${workExperience.organisation}'),
                Text('Start Date: ${workExperience.start}'),
                Text('End Date: ${workExperience.end}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Show the work experience entry edit form when the edit button is pressed
                _showEditWorkExperienceForm(
                    context, workExperienceProvider, index);
              },
            ),
          );
        },
      ),
    );
  }

  void _showEditWorkExperienceForm(BuildContext context,
      WorkExperienceProvider workExperienceProvider, int index) {
    final workExperience = workExperienceProvider.experience[index];

    final TextEditingController positionController =
        TextEditingController(text: workExperience.position);
    final TextEditingController companyController =
        TextEditingController(text: workExperience.organisation);
    final TextEditingController startYearController = TextEditingController(
        text: DateFormat.yMMMd().format(workExperience.start));
    final TextEditingController endYearController = TextEditingController(
        text: DateFormat.yMMMd().format(workExperience.end));
    final TextEditingController descriptionController =
        TextEditingController(text: workExperience.description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Work Experience Entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: positionController,
                  decoration: const InputDecoration(labelText: 'Position'),
                ),
                TextField(
                  controller: companyController,
                  decoration: const InputDecoration(labelText: 'Company'),
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
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
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
                final updatedPosition = positionController.text;
                final updatedCompany = companyController.text;
                final updatedStartYear =
                    DateFormat.yMMMd().parse(startYearController.text);
                final updatedEndYear =
                    DateFormat.yMMMd().parse(endYearController.text);
                final updatedDescription = descriptionController.text;

                // Update the work experience entry with the updated data
                final updatedWorkExperience = WorkExperience(
                  position: updatedPosition,
                  organisation: updatedCompany,
                  start: updatedStartYear,
                  end: updatedEndYear,
                  description: updatedDescription,
                );
                workExperienceProvider.updateExperience(
                    index, updatedWorkExperience);

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
