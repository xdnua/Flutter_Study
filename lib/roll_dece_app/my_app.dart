import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/roll_dece_app/gradient_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: GradientContainer(),
    );
  }
}
