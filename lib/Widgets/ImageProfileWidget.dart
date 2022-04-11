import 'package:flutter/material.dart';
class ImageProfileWidget extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ImageProfileWidget({
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 10),
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
