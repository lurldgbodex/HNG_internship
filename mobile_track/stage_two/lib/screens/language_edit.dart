import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_two/providers/language_provider.dart';

import '../models/language.dart';

class LanguageEditScreen extends StatefulWidget {
  static const routeName = '/language-edit-screen';
  const LanguageEditScreen({super.key});

  @override
  State<LanguageEditScreen> createState() => _LanguageEditScreenState();
}

class _LanguageEditScreenState extends State<LanguageEditScreen> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Languages'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: languageProvider.language.length,
        itemBuilder: (context, index) {
          final language = languageProvider.language[index];

          return ListTile(
            title: Text('Language: ${language.language}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Proficiency: ${language.level}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Show the language entry edit form when the edit button is pressed
                _showEditLanguageForm(context, languageProvider, index);
              },
            ),
          );
        },
      ),
    );
  }

  void _showEditLanguageForm(
      BuildContext context, LanguageProvider languageProvider, int index) {
    final language = languageProvider.language[index];

    final TextEditingController languageNameController =
        TextEditingController(text: language.language);
    final TextEditingController proficiencyController =
        TextEditingController(text: language.level);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Language Entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: languageNameController,
                  decoration: const InputDecoration(labelText: 'Language'),
                ),
                TextField(
                  controller: proficiencyController,
                  decoration: const InputDecoration(labelText: 'Proficiency'),
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
                final updatedLanguageName = languageNameController.text;
                final updatedProficiency = proficiencyController.text;

                // Update the language entry with the updated data
                final updatedLanguage = Language(
                  language: updatedLanguageName,
                  level: updatedProficiency,
                );

                // Update the language list using the provider
                languageProvider.updateLanguage(index, updatedLanguage);

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
