import 'question.dart';
 

class QuizBrain {
  int _questionNumber = 0;

  //used underscore for private ,// encapsulation
  List<Question>_questionBank = [
    Question('The capital of India is New Delhi ?', true),
    Question('Are you living in US ?', false),
    Question(
        'Black is the most commonly used colour in all national flags around the world ?',
        false),
    Question('India has 29 state ?', true)
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
    
    // print(_questionNumber);
    // print(_questionBank.length);
  }

  String getquestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool finished(){
    if(_questionNumber >= _questionBank.length - 1)
    {
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }
}
