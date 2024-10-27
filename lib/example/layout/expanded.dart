import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            color: Colors.green,
            child: const Text('1'),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 100,
            color: Colors.lightBlue,
            child: const Text('Box2'),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 100,
            color: Colors.pink,
            child: const Text('Box2'),
          ),
        ),
      ],
    );
  }
}
