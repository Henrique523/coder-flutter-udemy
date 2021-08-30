
import 'package:flutter/material.dart';

import './resultado.dart';
import './questao.dart';
import './resposta.dart';

void main() {
	runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int indicePerguntas = 0;
  final _perguntas = const [
		{
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Vermelho', 'Azul', 'Verde'],
    },
		{
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cão', 'Gato', 'Pássaro'],
    },
    {
      'texto': 'Qual o seu instrutor favorito?',
      'respostas': ['Guilherme', 'Rafael', 'Alaor', 'Helisson'],
    }
	];

	void responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        indicePerguntas += 1;
      });
    }
	}

  bool get temPerguntaSelecionada {
    return indicePerguntas < _perguntas.length;
  }

	@override
	Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada 
      ? _perguntas[indicePerguntas].cast()['respostas']
      : null;

		return MaterialApp(
			home: Scaffold(
				appBar: AppBar(
					title: Text('Perguntas!'),
          centerTitle: true,
				),
				body: temPerguntaSelecionada
          ? Column(
            children: [
              Questao(_perguntas[indicePerguntas]['texto'].toString()),
              ...respostas.map((textoResposta) => Resposta(textoResposta, responder)).toList(),
              ],
          )
          : Resultado(),
			),
		);
	}
}