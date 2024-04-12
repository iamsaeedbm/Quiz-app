import 'package:quiz_app/question.dart';

List<Question> getQuestionList() {
  var firstQuest = Question();
  firstQuest.questionTitle = 'which car is the best in the world?';
  firstQuest.imageNameNum = '1';
  firstQuest.correctAnswer = 3;
  firstQuest.answerList = ['BMW', 'BENZ', 'Bentley', 'pershia'];

  var secondQuest = Question();
  secondQuest.questionTitle = 'which artist is the best in the world?';
  secondQuest.imageNameNum = '2';
  secondQuest.correctAnswer = 3;
  secondQuest.answerList = [
    'shajarian',
    'Eminem',
    'Leonardo da Vinci',
    'agha Roger Waters'
  ];
  return [firstQuest, secondQuest];
}
