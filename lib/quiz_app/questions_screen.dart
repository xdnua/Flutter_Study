import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lam_quen_flutter/quiz_app/data/questions.dart';
import 'package:lam_quen_flutter/quiz_app/widgets/answer_button.dart';
import 'package:lam_quen_flutter/quiz_app/results_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final List<String> selectedAnswers = [];
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    selectedAnswers.add(answer);

    if (currentQuestionIndex == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(chosenAnswers: selectedAnswers),
        ),
      );
      return;
    }

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Câu ${currentQuestionIndex + 1} / ${questions.length}',
          style: GoogleFonts.lexend(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
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
          children: [
            /// Hiển thị câu hỏi
            Text(
              currentQuestion.text,
              style: GoogleFonts.lexend(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            /// Danh sách câu trả lời (cuộn nếu dài)
            Expanded(
              child: ListView(
                children: currentQuestion.shuffledAnswers.map(
                  (answer) {
                    return AnswerButton(
                      answerText: answer,
                      onTap: () => answerQuestion(answer),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
