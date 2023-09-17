import 'package:flutter/material.dart';

import '../models/work_experience.dart';

class WorkExperienceProvider with ChangeNotifier {
  final List<WorkExperience> _experience = [
    WorkExperience(
      organisation: "F.C.T High Court",
      position: "Intern",
      start: DateTime(2021, 9, 1),
      end: DateTime(2022, 8, 31),
      description:
          "Worked in the accounts department for 8 months helping in keeping account records and managing account system. Also worked in the commissioners for Oaths department helping with provision of services to deponents in need of affidavits and providing technical support when needed.",
    )
  ];

  List<WorkExperience> get experience => _experience;

  void addExperience(WorkExperience newExperience) {
    _experience.add(newExperience);
    notifyListeners();
  }

  void removeExperience(int index) {
    if (index >= 0 && index < _experience.length) {
      _experience.removeAt(index);
      notifyListeners();
    }
  }

  void updateExperience(int index, WorkExperience updatedExperience) {
    if (index >= 0 && index < _experience.length) {
      _experience[index] = updatedExperience;
      notifyListeners();
    }
  }
}
