import 'package:flutter/material.dart';

import '../models/certification.dart';

class CertificationProvider with ChangeNotifier {
  final List<Certification> _certification = [
    Certification(
      title: "ALX Software Engineering",
      body: "Holberton Inc",
      date: DateTime(2023, 03, 27),
    ),
    Certification(
      title: "Mobile(Flutter)",
      body: "INGRESSIVE FOR GOOD X ZURI Training",
      date: DateTime(2023, 4, 1),
    ),
    Certification(
      title: "Intensive Cloud Computing",
      body: "The Cloud BootCamp",
      date: DateTime(2023, 7, 6),
    ),
  ];

  List<Certification> get certification => _certification;

  void addCertification(Certification newCertification) {
    _certification.add(newCertification);
    notifyListeners();
  }

  void removeCertification(int index) {
    if (index >= 0 && index < _certification.length) {
      _certification.removeAt(index);
      notifyListeners();
    }
  }

  void updateCertification(int index, Certification updatedCertification) {
    if (index >= 0 && index < _certification.length) {}
    _certification[index] = updatedCertification;
  }
}
