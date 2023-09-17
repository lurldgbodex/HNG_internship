import 'package:flutter/material.dart';
import '/models/skill.dart';

class UpdateSkillForm extends StatefulWidget {
  final Skill skill;
  final Function(Skill) onUpdate;

  const UpdateSkillForm(
      {super.key, required this.skill, required this.onUpdate});

  @override
  State<UpdateSkillForm> createState() => _UpdateSkillFormState();
}

class _UpdateSkillFormState extends State<UpdateSkillForm> {
  late TextEditingController titleController;
  late TextEditingController skillsController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.skill.title);
    skillsController =
        TextEditingController(text: widget.skill.skill.join(','));
  }

  @override
  void dispose() {
    super.dispose();
    skillsController.dispose();
    titleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('UpdateSkill'),
      content: Column(
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: skillsController,
            decoration:
                const InputDecoration(labelText: 'Skills (comma-separated)'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final updatedTitle = titleController.text;
            final updatedSkills = skillsController.text.split(', ');

            final updatedSkill = Skill(
              title: updatedTitle,
              skill: updatedSkills,
            );
            widget.onUpdate(updatedSkill);
            Navigator.of(context).pop();
          },
          child: const Text('Update'),
        )
      ],
    );
  }
}
