import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  void _reiniciar() {
    print('Reiniciado');
  }

  void _abrir(Campo campo) {
    campo.abrir();
  }

  void _alternarMarcacao(Campo campo) {
    campo.alternarMarcacao();
  }

  @override
  Widget build(BuildContext context) {
    Campo campo = Campo(linha: 0, coluna: 0);

    try {
      campo.minar();
      campo.abrir();
    } on ExplosaoException {

    }

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
