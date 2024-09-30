class QuizQuestions {
  const QuizQuestions(this.question, this.answer);
  final String question;
  final List<String> answer;

  List<String> get shuffleAnswers {
    final shuffleList = List.of(answer);
    shuffleList.shuffle();
    return shuffleList;
  }
}
