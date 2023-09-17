import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/education_provider.dart';
import '../models/education.dart';

class MyEducation extends StatelessWidget {
  const MyEducation({super.key});

  @override
  Widget build(BuildContext context) {
    final educationProvider = Provider.of<EducationProvider>(context);
    List<Education> resumeEducation = educationProvider.education;

    return Column(
      children: [
        Text(
          'Education',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ...resumeEducation.map(
          (e) => Column(
            children: [
              Text(
                e.school,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    e.degree,
                  ),
                  Text(e.grade),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    DateFormat.yMMMd().format(e.startDate),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    DateFormat.yMMMd().format(e.endDate),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
