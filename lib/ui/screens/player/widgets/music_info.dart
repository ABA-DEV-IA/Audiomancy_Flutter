import 'package:flutter/material.dart';

class MusicInfo extends StatelessWidget {
  final String title;
  final String author;
  final String? license;

  const MusicInfo({
    super.key,
    required this.title,
    required this.author,
    this.license,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(author, style: const TextStyle(fontSize: 14)),
        if (license != null) ...[
          const SizedBox(height: 2),
          Text(license!, style: const TextStyle(fontSize: 12)),
        ],
      ],
    );
  }
}
