import 'package:flutter/material.dart';

import '../models/language.dart';

class LanguageProvider with ChangeNotifier {
  final List<Language> _languages = [
    Language(
      language: "Yoruba",
      level: "Native",
    ),
    Language(
      language: "Spanish",
      level: "Basic",
    ),
    Language(
      language: "English",
      level: "Fluent",
    ),
  ];

  List<Language> get language => _languages;

  void addLanguage(Language newLanguage) {
    _languages.add(newLanguage);
    notifyListeners();
  }

  void removeLanguage(int index) {
    if (index >= 0 && index < _languages.length) {
      _languages.removeAt(index);
      notifyListeners();
    }
  }

  void updateLanguage(int index, Language updatedLanguage) {
    if (index >= 0 && index < _languages.length) {
      _languages[index] = updatedLanguage;
      notifyListeners();
    }
  }
}
