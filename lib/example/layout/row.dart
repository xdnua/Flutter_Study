import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/example/layout/container.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerDemo(),
          ContainerDemo(),
          ContainerDemo(),
          ContainerDemo(),
        ],
      ),
    );
  }
}
