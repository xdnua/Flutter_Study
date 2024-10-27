import 'package:flutter/material.dart';

class MaterialApp1 extends StatelessWidget {
  const MaterialApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/login', routes: {
      '/home': (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
        );
      },
      '/login': (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
          ),
        );
      },
    });
  }
}

class MaterialApp2 extends StatelessWidget {
  const MaterialApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApp Theme'),
        ),
      ),
    );
  }
}
