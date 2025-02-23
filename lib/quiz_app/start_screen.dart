import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/quiz_app/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                /// Logo mờ 60%
                Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    'assets/images/quiz-logo.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                const SizedBox(height: 50),

                /// Tiêu đề
                const Text(
                  'Học Flutter theo cách thú vị!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                /// Nút Start Quiz
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuestionsScreen(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    side: const BorderSide(color: Colors.white),
                  ),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text('Bắt đầu ngay!'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
