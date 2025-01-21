import 'package:flutter/material.dart';

class Stateless extends StatelessWidget {
  const Stateless({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stateless Widget'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Page 1'),
              Tab(text: 'Page 2'),
              Tab(text: 'Page 3'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _TabPage1(),
            _TabPage2(),
            _TabPage3(),
          ],
        ),
      ),
    );
  }
}

class _TabPage1 extends StatelessWidget {
  const _TabPage1();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          _buildColoredContainer(500, Colors.amberAccent),
          _buildColoredContainer(500, Colors.blue),
          _buildImageGrid(),
        ],
      ),
    );
  }

  Widget _buildColoredContainer(double height, Color color) {
    return Container(
      height: height,
      color: color,
    );
  }

  Widget _buildImageGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.2,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Image.asset('assets/images/gallery${index + 1}.png');
      },
    );
  }
}

class _TabPage2 extends StatelessWidget {
  const _TabPage2();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Page 2',
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }
}

class _TabPage3 extends StatelessWidget {
  const _TabPage3();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Page 3',
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent),
      ),
    );
  }
}
