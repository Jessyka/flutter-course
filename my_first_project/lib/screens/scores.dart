import 'package:flutter/material.dart';
import 'package:my_first_project/screens/question.dart';

class ScoreScreen extends StatelessWidget{
  final int _score;
  
  const ScoreScreen(this._score);

  String _getUserMessage(){
    return _score == 0 ? 'Não foi dessa vez! Tente novamente.' : 'Parabens! Vc conseguiu acertar $_score questões!';
  }

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${_getUserMessage()}',
                ),
              ],
            ),
          ),
           TextButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => QuestionPage(title: 'Meu Questionário')), (_) => false);
          }, 
          child: const Text(
            'Reiniciar Questionario',
            style: TextStyle(fontSize: 18),
          ))
        ]
      )
    );
  }
}