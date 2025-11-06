import 'package:flutter/material.dart';

class MusicThumbnail extends StatelessWidget {
  final String imageUrl;
  final double size;

  const MusicThumbnail({super.key, required this.imageUrl, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
