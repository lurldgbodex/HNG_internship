import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/certification_provider.dart';
import '../models/certification.dart';

class MyCertifications extends StatelessWidget {
  const MyCertifications({super.key});

  @override
  Widget build(BuildContext context) {
    final certificationProvider = Provider.of<CertificationProvider>(context);

    List<Certification> certificates = certificationProvider.certification;
    return Column(
      children: [
        Text(
          'Certifications',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ...certificates.map(
          (e) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      DateFormat.yMMMd().format(e.date),
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8),
                margin: const EdgeInsets.only(bottom: 8),
                alignment: Alignment.topLeft,
                child: Text(
                  e.body,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
