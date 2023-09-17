import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:stage_two/providers/profile_provider.dart';

import '../screens/github_screen.dart';
import '../models/profile.dart';

class MyBio extends StatelessWidget {
  const MyBio({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final Profile resumeBio = profileProvider.myProfile;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: double.infinity,
          child: Text(
            resumeBio.fullName,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          resumeBio.subtitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          resumeBio.address,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).pushNamed(MyGithubScreen.route);
          },
          icon: const Icon(
            SimpleIcons.github,
            size: 27,
          ),
          label: Text(
            'Github',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            resumeBio.bio,
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
