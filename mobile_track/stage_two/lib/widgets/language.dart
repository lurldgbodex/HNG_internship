import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../models/language.dart';

class MyLanguages extends StatelessWidget {
  const MyLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    List<Language> myLanguage = languageProvider.language;
    return Column(
      children: [
        Text(
          'Languages',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...myLanguage.map(
              (e) => Column(
                children: [
                  Text(e.language,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(e.level),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
