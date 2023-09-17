import 'package:flutter/material.dart';

import '../models/skill.dart';

class SkillProvider with ChangeNotifier {
  final List<Skill> _skills = [
    Skill(
      title: "Programming Languages:",
      skill: ["C, ", "Python, ", "Javascript, ", "Java, "],
    ),
    Skill(
      title: "Database:",
      skill: ["Postgres, ", "MySQL, ", "MongoDB, ", "Redis, "],
    ),
    Skill(
      title: "Software Development Principles:",
      skill: ["Agile Methodology, ", "Version Control, "],
    ),
    Skill(
      title: "Devops:",
      skill: ["Puppet, ", "Bash, ", "Terraform, ", "Docker, "],
    ),
  ];

  List<Skill> get skills => _skills;

  void addSkill(Skill newSkill) {
    _skills.add(newSkill);
    notifyListeners();
  }

  void removeSkill(int index) {
    _skills.removeAt(index);
    notifyListeners();
  }

  void updateSkill(int index, Skill updatedSkill) {
    if (index >= 0 && index < _skills.length) {
      _skills[index] = updatedSkill;
      notifyListeners();
    }
  }
}
