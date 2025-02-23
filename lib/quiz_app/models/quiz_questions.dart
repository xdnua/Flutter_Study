class QuizQuestion {
  final String text;
  final List<String> answers;

  QuizQuestion(this.text, List<String> answers)
      : answers = List.unmodifiable(answers);

  List<String> get shuffledAnswers => List.of(answers)..shuffle();
}
