import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final int indicePerguntas;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.indicePerguntas,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return indicePerguntas < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada 
      ? perguntas[indicePerguntas].cast()['respostas']
      : null;

    return Column(
      children: [
        Questao(perguntas[indicePerguntas]['texto'].toString()),
        ...respostas.map((textoResposta) => Resposta(textoResposta, responder)).toList(),
        ],
    );
  }
}