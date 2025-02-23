import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/todo_app/demo_buttons.dart';

class UIUpdatesDemo extends StatelessWidget {
  const UIUpdatesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    print('UIUpdatesDemo BUILD called');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Updates'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Every Flutter developer should have a basic understanding of Flutter\'s internals!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Do you understand how Flutter updates UIs?',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              DemoButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
