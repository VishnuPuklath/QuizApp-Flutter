import 'package:flutter/material.dart';
import 'package:quizy/ques_brain.dart';
import 'package:quizy/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
 
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper=[];
  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

 
  
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
                    quizBrain.getQuestionText().toString(),
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
                 checkAnswer(true);
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
                      checkAnswer(false);
                    },
                    child: Text('False'),
                  ),
                ),
              ),Row(children:scoreKeeper,)
            ]),
      ),
    );
  }
}
