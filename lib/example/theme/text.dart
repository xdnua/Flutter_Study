import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Demo 1'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Google',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
              ),
            ),
            RichTextDemo2(),
          ],
        ),
      ),
    );
  }
}

class RichTextDemo1 extends StatelessWidget {
  const RichTextDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'G',
        style: TextStyle(
            fontSize: 60, color: Colors.blue, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: 'o',
            style: TextStyle(
                fontSize: 60, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'o',
            style: TextStyle(
                fontSize: 60,
                color: Colors.yellow,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'g',
            style: TextStyle(
                fontSize: 60, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'l',
            style: TextStyle(
                fontSize: 60, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'e',
            style: TextStyle(
                fontSize: 60, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo2 extends StatelessWidget {
  const RichTextDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'G',
              style: TextStyle(
                  fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            TextSpan(
              text: 'o',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            TextSpan(
              text: 'g',
              style: TextStyle(
                  fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            TextSpan(
              text: 'l',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            TextSpan(
              text: 'e',
              style: TextStyle(
                  fontSize: 60, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
