import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: const Image(
          image: AssetImage('assets/images/image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
