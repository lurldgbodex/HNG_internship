import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/profile.dart';
import '../providers/profile_provider.dart';

class ProfileEditScreen extends StatelessWidget {
  static const routeName = '/edit-screen-form';
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _slackNameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    //Initialize the text field with current data
    _fullNameController.text = profileProvider.myProfile.fullName;
    _slackNameController.text = profileProvider.myProfile.slackName;
    _roleController.text = profileProvider.myProfile.subtitle;
    _githubController.text = profileProvider.myProfile.githubLink;
    _addressController.text = profileProvider.myProfile.address;
    _bioController.text = profileProvider.myProfile.bio;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bio'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'Enter your full name...',
                ),
              ),
              TextField(
                controller: _slackNameController,
                decoration: const InputDecoration(
                  labelText: 'Slack Name',
                  hintText: 'Enter your slack name...',
                ),
              ),
              TextField(
                controller: _roleController,
                decoration: const InputDecoration(
                  labelText: 'Role',
                  hintText: 'Enter your role...',
                ),
              ),
              TextField(
                controller: _githubController,
                decoration: const InputDecoration(
                  labelText: 'GitHub Link',
                  hintText: 'Enter your repo link...',
                ),
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  hintText: 'Enter your address...',
                ),
              ),
              TextField(
                controller: _bioController,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                  hintText: 'Enter your bio...',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final newFullNmae = _fullNameController.text;
                      final newSlackName = _slackNameController.text;
                      final newRole = _roleController.text;
                      final newGithubLink = _githubController.text;
                      final newAddress = _addressController.text;
                      final newBio = _bioController.text;
                      final updatedProfile = Profile(
                        fullName: newFullNmae,
                        slackName: newSlackName,
                        subtitle: newRole,
                        githubLink: newGithubLink,
                        address: newAddress,
                        bio: newBio,
                      );
                      profileProvider.updateProfile(updatedProfile);
                      Navigator.pop(context); // Return to the previous screen
                    },
                    child: const Text('Update Profile'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
