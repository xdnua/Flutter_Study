import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/todo_app/widgets/keys.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: Keys(),
    );
  }
}
