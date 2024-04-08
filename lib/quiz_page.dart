import 'package:flutter/material.dart';
import 'package:quiz_app/constant.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int shownQuestIndex = 0;
  var list = [
    ListTile(
      title: Text('answer 1'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    String questImageIndex = getQuestionList()[shownQuestIndex].imageNameNum!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Page',
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
                Image(
                  image: AssetImage('images/$questImageIndex.png'),
                  fit: BoxFit.contain,
                ),
                Text(
                  getQuestionList()[shownQuestIndex].questionTitle!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ...List.generate(4, (index) => getOptionsItem(index)),
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
        getQuestionList()[shownQuestIndex].answerList![index],
      ),
      onTap: () {
        setState(() {
          shownQuestIndex++;
        });
      },
    );
  }
}
