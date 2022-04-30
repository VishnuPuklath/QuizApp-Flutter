import 'package:flutter/material.dart';
import 'package:quizy/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet',
  //   'A slug\'s blood is green'
  // ];

  List<Question> questionBank = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet', a: true),
      Question(q: 'A slug\'s blood is green', a: false),
  ];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    questionBank[questionNumber].questionText.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {
                  bool? correctAnswer=questionBank[questionNumber].questionAnswer;
                  if(correctAnswer==true){
                    print('user entered correct answer');
                  }else{
                    print('user entered wrong answer');
                  }
                      setState(() {
                        questionNumber = questionNumber + 1;
                      });
                    },
                    child: Text('TRUE'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      bool? correctAnswer=questionBank[questionNumber].questionAnswer;
                  if(correctAnswer==false){
                    print('user entered correct answer');
                  }else{
                    print('user entered wrong answer');
                  }
                      setState(() {
                        questionNumber = questionNumber + 1;
                      });
                    },
                    child: Text('False'),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
