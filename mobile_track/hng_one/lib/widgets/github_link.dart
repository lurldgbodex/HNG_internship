import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

import '/github_web.dart';

class IconButtonLink extends StatelessWidget {
  const IconButtonLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GithubWebView(),
            ));
      },
      icon: const Icon(SimpleIcons.github),
      label: const Text('Open Github'),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.green),
      ),
    );
  }
}
