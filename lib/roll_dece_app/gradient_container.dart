import 'dart:math';
import 'package:flutter/material.dart';

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  static final Random _random = Random();
  int _currentDiceRoll = 2;

  void _rollDice() {
    setState(() {
      _currentDiceRoll = _random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Dice Roller')),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Colors.deepPurple, Colors.deepOrange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DiceImage(diceNumber: _currentDiceRoll),
              const SizedBox(height: 20),
              TextButton(
                onPressed: _rollDice,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Roll Dice'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiceImage extends StatelessWidget {
  final int diceNumber;

  const DiceImage({super.key, required this.diceNumber});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/dice-$diceNumber.png',
      width: 100,
      height: 100,
    );
  }
}
