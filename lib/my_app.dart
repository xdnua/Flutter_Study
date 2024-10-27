import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/example/layout/expanded.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExpandedDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
