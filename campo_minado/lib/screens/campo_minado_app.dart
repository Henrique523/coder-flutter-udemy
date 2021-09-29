import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatefulWidget {
  const CampoMinadoApp({Key? key}) : super(key: key);

  @override
  _CampoMinadoAppState createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  Tabuleiro _tabuleiro = Tabuleiro(
    linhas: 10,
    colunas: 10,
    qtdeBombas: 3,
  );

  void _reiniciar() {
    print('Reiniciado');
  }

  void _abrir(Campo campo) {
    setState(() {
      campo.abrir();
    });
  }

  void _alternarMarcacao(Campo campo) {
    setState(() {
      campo.alternarMarcacao();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          onReiniciar: _reiniciar,
          venceu: _venceu,
        ),
        body: Container(
          child: TabuleiroWidget(
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
            tabuleiro: _tabuleiro,
          ),
        ),
      ),
    );
  }
}
