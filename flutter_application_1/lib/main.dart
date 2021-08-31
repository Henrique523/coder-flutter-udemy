import 'package:flutter/material.dart';
import 'package:flutter_application_1/questionario.dart';

import './resultado.dart';
import './questionario.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int indicePerguntas = 0;
  int _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Vermelho', 'pontuacao': 10},
        {'texto': 'Azul', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cão', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 5},
        {'texto': 'Pássaro', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': [
        {'texto': 'Guilherme', 'pontuacao': 10},
        {'texto': 'Rafael', 'pontuacao': 5},
        {'texto': 'Alaor', 'pontuacao': 3},
        {'texto': 'Helisson', 'pontuacao': 1},
      ],
    }
  ];

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        indicePerguntas += 1;
        _pontuacaoTotal += pontuacao;
      });

      print(_pontuacaoTotal);
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      indicePerguntas = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return indicePerguntas < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas!'),
          centerTitle: true,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                indicePerguntas: indicePerguntas,
                responder: responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
