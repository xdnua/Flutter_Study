import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/quiz_app/data/questions.dart';
import 'package:lam_quen_flutter/quiz_app/questions_screen.dart';
import 'package:lam_quen_flutter/quiz_app/widgets/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  /// Tạo danh sách tổng kết câu hỏi
  List<Map<String, Object>> _generateSummaryData() {
    return List.generate(chosenAnswers.length, (i) {
      return {
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = _generateSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [Colors.deepPurple, Colors.deepOrange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Bạn đã trả lời đúng $numCorrectQuestion trong $numTotalQuestion câu hỏi!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              QuestionsSummary(summaryData: summaryData),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuestionsScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.restart_alt),
                label: const Text('Restart Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
