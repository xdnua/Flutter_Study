import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/example/layout/container.dart';

class ColumDemo extends StatelessWidget {
  const ColumDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerDemo(),
          Text('Your Story'),
        ],
      ),
    );
  }
}
