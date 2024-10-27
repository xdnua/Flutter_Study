import 'package:flutter/material.dart';

class LessWidget extends StatelessWidget {
  const LessWidget({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: null,
        icon: isFavorite
            ? const Icon(Icons.favorite, color: Colors.pinkAccent)
            : const Icon(Icons.favorite_border));
  }
}
