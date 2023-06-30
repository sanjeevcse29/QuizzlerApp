import 'package:flutter/material.dart';
//import 'question.dart';// unused import
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//create object for QuizBarn Class
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(child: QuizPage()),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Scorekeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctanswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.finished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        Scorekeeper = [];
      } else {
        if (correctanswer == userPickedAnswer) {
          Scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          // print('user got it right');
        } else {
          Scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          //print('user got it wrong');
        }

        quizBrain.nextQuestion();
        //print(questionnumber);
      }
    });
  }
// List<String> questions = [
//   'The capital of India is New Delhi ?',
//   'Are you living in US ?',
//   'Black is the most commonly used colour in all national flags around the world ?', // used backslash then ignored fist ending comma
//   'India has 29 state ?'
// ];
//List<bool> answers = [true, false, false, true];
// create q1 object for Question class
// Question q1 = Question(q:  'The capital of India is New Delhi ?', a: true);
//create object for list of Question

// List<Question> questionBank = [
//   Question(q: 'The capital of India is New Delhi ?', a: true),
//   Question(q: 'Are you living in US ?', a: false),
//   Question(q: 'Black is the most commonly used colour in all national flags around the world ?', a: false),
//   Question(q:  'India has 29 state ?', a: true)
// ];

//remove from here 'int questionnumber = 0' gone to quiz_brain.dart and make private
//int questionnumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //'This is where the que text will go',
                quizBrain.getquestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  //textStyle: TextStyle(color: Colors.black)
                ),
                onPressed: () {
                  checkAnswer(true);

                  // the user picked true
                },
                child: Text(
                  'True',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  //textStyle: TextStyle(color: Colors.black)
                ),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ),
        //todo add a row as your score keeper
        Row(
          children: Scorekeeper,
        )
      ],
    );
  }
}
