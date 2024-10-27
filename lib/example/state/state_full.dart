import 'package:flutter/material.dart';

class FullWidget extends StatefulWidget {
  const FullWidget({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  State<StatefulWidget> createState() => _StateFull();
}

class _StateFull extends State<FullWidget> {
  var isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  void dispose() {
    super.dispose();
  }

  buttonFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: buttonFavorite,
      icon: isFavorite
          ? const Icon(
              Icons.favorite,
              color: Colors.pinkAccent,
            )
          : const Icon(Icons.favorite_border),
    );
  }
}
