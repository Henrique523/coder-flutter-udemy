import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressinante!';
    } else {
      return 'Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
          IconButton(
            icon: const Icon(Icons.restart_alt),
            onPressed: reiniciarQuestionario,
            iconSize: 40,
          ),
          Text('Clique no ícone para reiniciar o questionário.')
        ],
      ),
    );
  }
}