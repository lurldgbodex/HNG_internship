import 'package:flutter/material.dart';

import './widgets/imageAsset.dart';
import './widgets/github_link.dart';

class HomepageScreen extends StatelessWidget {
  final String title;
  const HomepageScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Center(
              child: Column(
                children: [
                  ImageAsset(height: height * 0.75, width: width),
                  const IconButtonLink(),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Row(
                children: [
                  ImageAsset(height: height, width: width * 0.7),
                  SizedBox(
                    height: height * 0.3,
                    child: const IconButtonLink(),
                  ),
                ],
              ),
            ),
    );
  }
}
