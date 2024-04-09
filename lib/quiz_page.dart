import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int shownQuestIndex = 0;
  Question? selectedQuestion;
  bool isFinalAnswer = false;
  int correctAnswer = 0;
  @override
  Widget build(BuildContext context) {
    String questImageIndex = getQuestionList()[shownQuestIndex].imageNameNum!;
    selectedQuestion = getQuestionList()[shownQuestIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quest ${shownQuestIndex + 1} OF ${getQuestionList().length}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: 500,
                  child: Image(
                    image: AssetImage('images/$questImageIndex.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  selectedQuestion!.questionTitle!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ...List.generate(4, (index) => getOptionsItem(index)),
                if (isFinalAnswer)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ResultPage(resultAnswer: correctAnswer),
                        ),
                      );
                    },
                    child: Text('RESULT'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getOptionsItem(int index) {
    return ListTile(
      title: Text(
        selectedQuestion!.answerList![index],
      ),
      onTap: () {
        if (selectedQuestion!.correctAnswer == index) {
          correctAnswer++;
        }

        if (shownQuestIndex == getQuestionList().length - 1) {
          isFinalAnswer = true;
        }

        setState(
          () {
            if (shownQuestIndex < getQuestionList().length - 1) {
              shownQuestIndex++;
            }
          },
        );
      },
    );
  }
}
