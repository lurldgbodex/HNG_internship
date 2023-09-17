import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/skill_provider.dart';
import '../models/skill.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    final skillProvider = Provider.of<SkillProvider>(context);
    List<Skill> resumeSkill = skillProvider.skills;

    return Column(
      children: [
        Text(
          "Skills",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ...resumeSkill.map(
          (e) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      e.title,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  ...e.skill.map(
                    (e) => Text(
                      e,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
