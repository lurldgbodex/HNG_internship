import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/project_provider.dart';
import '../models/project.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final projectProvider = Provider.of<ProjectProvider>(context);
    List<Project> myProjects = projectProvider.projects;

    return Column(
      children: [
        Text(
          'Projects',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ...myProjects.map(
          (e) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      e.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      e.subtitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              ...e.description.map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e,
                      textAlign: TextAlign.justify,
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
