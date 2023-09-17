import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/project_provider.dart';
import '../models/project.dart';

class ProjectEditScreen extends StatefulWidget {
  static const routeName = '/project-edit';
  const ProjectEditScreen({super.key});

  @override
  State<ProjectEditScreen> createState() => _ProjectEditScreenState();
}

class _ProjectEditScreenState extends State<ProjectEditScreen> {
  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Projects"),
      ),
      body: ListView.builder(
        itemCount: projectProvider.projects.length,
        itemBuilder: (context, index) {
          final project = projectProvider.projects[index];
          return ListTile(
            title: Text('Project Name: ${project.title}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subtitle: ${project.subtitle}'),
                Text('Stack: ${project.stack}'),
                Text('SourcCode: ${project.sourceCode}'),
                Text('Description: ${project.description}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Show the project entry edit form when the edit button is pressed
                _showEditProjectForm(context, projectProvider, index);
              },
            ),
          );
        },
      ),
    );
  }

  void _showEditProjectForm(
      BuildContext context, ProjectProvider projectProvider, int index) {
    final project = projectProvider.projects[index];

    final TextEditingController projectNameController =
        TextEditingController(text: project.title);
    final TextEditingController subtitleController =
        TextEditingController(text: project.subtitle);
    final TextEditingController descriptionController =
        TextEditingController(text: project.description.join(', '));

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Project Entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: projectNameController,
                  decoration: const InputDecoration(labelText: 'Project Name'),
                ),
                TextField(
                  controller: subtitleController,
                  decoration: const InputDecoration(labelText: 'Project type'),
                ),
                TextField(
                  controller: descriptionController,
                  maxLines: null,
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
                final updatedProjectName = projectNameController.text;
                final updatedDescription =
                    descriptionController.text.split(', ');
                final updatedtype = subtitleController.text;

                // Update the project entry with the updated data
                final updatedProject = Project(
                  title: updatedProjectName,
                  subtitle: updatedtype,
                  description: updatedDescription,
                  stack: project.stack,
                  sourceCode: project.sourceCode,
                );

                // Update the project list using the provider
                projectProvider.updateProject(index, updatedProject);

                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
