import 'package:flutter/material.dart';

class MusicThumbnail extends StatelessWidget {
  final String? imageUrl;
  final double size;

  const MusicThumbnail({super.key, this.imageUrl, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl ?? 'https://via.placeholder.com/100',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
