import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../edit/edit_skill.dart';
import '/providers/skill_provider.dart';

class EditSkillsScreen extends StatelessWidget {
  static const routeName = '/edit-skills';
  const EditSkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skillProvider = Provider.of<SkillProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Skills'),
      ),
      body: ListView.builder(
        itemCount: skillProvider.skills.length,
        itemBuilder: (context, index) {
          final skill = skillProvider.skills[index];
          return ListTile(
            title: Text(skill.title),
            subtitle: Text(skill.skill.join(' ')),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return UpdateSkillForm(
                      skill: skill,
                      onUpdate: (updatedSkill) {
                        skillProvider.updateSkill(index, updatedSkill);
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
