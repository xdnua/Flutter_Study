import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/context/bottom_sheet.dart';
import 'package:lam_quen_flutter/state/state_full.dart';
import 'package:lam_quen_flutter/state/state_less.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Index of the selected page

  final List<Widget> _pages = const [
    Stateless(), // Stateless screen
    Stateful(), // Stateful screen
    BottomSheetDemo(), // BottomSheet screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected page index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Stateless',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Stateful',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.more_horiz),
            ),
            label: 'BottomSheet',
            backgroundColor: Colors.brown,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
