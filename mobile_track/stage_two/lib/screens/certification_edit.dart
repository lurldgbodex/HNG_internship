import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/certification_provider.dart';
import '../models/certification.dart';

class CertificationEditScreen extends StatefulWidget {
  static const routeName = '/certification-edit';
  const CertificationEditScreen({super.key});

  @override
  State<CertificationEditScreen> createState() =>
      _CertificationEditScreenState();
}

class _CertificationEditScreenState extends State<CertificationEditScreen> {
  @override
  Widget build(BuildContext context) {
    final certificationProvider = Provider.of<CertificationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Certification"),
      ),
      body: ListView.builder(
        itemCount: certificationProvider.certification.length,
        itemBuilder: (context, index) {
          final certification = certificationProvider.certification[index];

          return ListTile(
            title: Text('Certification: ${certification.title}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Issuing Organization: ${certification.body}'),
                Text('Date: ${certification.date}'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Show the certification entry edit form when the edit button is pressed
                _showEditCertificationForm(
                    context, certificationProvider, index);
              },
            ),
          );
        },
      ),
    );
  }

  void _showEditCertificationForm(BuildContext context,
      CertificationProvider certificationProvider, int index) {
    final certification = certificationProvider.certification[index];

    final TextEditingController certificationNameController =
        TextEditingController(text: certification.title);
    final TextEditingController issuingOrganizationController =
        TextEditingController(text: certification.body);
    final TextEditingController dateController = TextEditingController(
        text: DateFormat.yMMMd().format(certification.date));

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Certification Entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: certificationNameController,
                  decoration:
                      const InputDecoration(labelText: 'Certification Name'),
                ),
                TextField(
                  controller: issuingOrganizationController,
                  decoration:
                      const InputDecoration(labelText: 'Issuing Organization'),
                ),
                TextField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(labelText: 'Date'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final updatedCertificationName =
                    certificationNameController.text;
                final updatedIssuingOrganization =
                    issuingOrganizationController.text;
                final updatedDate =
                    DateFormat.yMMMd().parse(dateController.text);

                // Update the certification entry with the updated data
                final updatedCertification = Certification(
                  title: updatedCertificationName,
                  body: updatedIssuingOrganization,
                  date: updatedDate,
                );
                certificationProvider.updateCertification(
                    index, updatedCertification);

                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
