import 'package:flutter/material.dart';
import 'package:my_first_project/models/question_model.dart';
import 'package:my_first_project/screens/scores.dart';

class QuestionPage extends StatefulWidget {
  QuestionPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int _score = 0;
  int _counter = 0;
  List<Question> _questions = [
    new Question('Onde se localiza Machu Picchu?', 'Colômbia', 'Peru', 'China', 2),
    new Question('Que país tem o formato de uma bota?', 'Brasil', 'Portugal', 'Italia', 3),
    new Question('Quem inventou a lâmpada?', 'Graham Bell', 'Steve Jobs', 'Thomas Edison', 3),
    new Question('De quem é a famosa frase “Penso, logo existo”?', 'Platão', 'Descartes', 'Sócrates', 2),
    new Question('Quais o menor e o maior país do mundo?', 'Vaticano e Rússia', 'Nauru e China', 'Mônaco e Canadá', 1),
  ];

  void _registerOptionSelected(int selected, BuildContext context){
    if(selected == _questions[_counter].correctOption){
      setState(() {
        _score++;
      });
    }
    _incrementCounter(context);
  }

  void _incrementCounter(BuildContext context) {
    if(_counter < (_questions.length - 1)){
      setState(() {
        _counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _counter < (_questions.length - 1) ? 
        (Container(
          width: double.infinity,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${this._questions[_counter].question}',
              ),
              TextButton(
                child: Text('${this._questions[_counter].fistOption.description}'),
                onPressed: () => _registerOptionSelected(this._questions[_counter].fistOption.value, context)),
              TextButton(
                child: Text('${this._questions[_counter].secondOption.description}'),
                onPressed: () => _registerOptionSelected(this._questions[_counter].secondOption.value, context)),
              TextButton(
                child: Text('${this._questions[_counter].thirdOption.description}'),
                onPressed: () => _registerOptionSelected(this._questions[_counter].thirdOption.value, context)),
            ],
          ),
        )) 
        : ScoreScreen(_score),
    );
  }
}