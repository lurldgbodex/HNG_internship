import 'package:flutter/material.dart';

import '../models/education.dart';

class EducationProvider with ChangeNotifier {
  final List<Education> _education = [
    Education(
      school: "Ladoke Akintola University of Technology",
      degree: "Bachelor of Technology",
      grade: "Second Class Upper",
      startDate: DateTime(2014, 12),
      endDate: DateTime(2021, 06),
    ),
  ];

  List<Education> get education => _education;

  void addEducation(Education newEducation) {
    _education.add(newEducation);
    notifyListeners();
  }

  void removeEducation(int index) {
    if (index >= 0 && index < _education.length) {
      _education.removeAt(index);
      notifyListeners();
    }
  }

  void updateEducation(int index, Education updatedEducation) {
    if (index >= 0 && index < _education.length) {
      _education[index] = updatedEducation;
      notifyListeners();
    }
  }
}
