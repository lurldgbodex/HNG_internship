import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/experience_provider.dart';
import '../models/work_experience.dart';

class MyWorkExperience extends StatelessWidget {
  const MyWorkExperience({super.key});

  @override
  Widget build(BuildContext context) {
    final experience = Provider.of<WorkExperienceProvider>(context);
    List<WorkExperience> myXperience = experience.experience;

    return Column(
      children: [
        Text(
          'Work Experience',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ...myXperience.map(
          (e) => Column(
            children: [
              Text(
                e.organisation,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      e.position,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        Text(
                          '(${DateFormat.yMMMd().format(e.start)} - ${DateFormat.yMMMd().format(e.end)})',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  e.description,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
