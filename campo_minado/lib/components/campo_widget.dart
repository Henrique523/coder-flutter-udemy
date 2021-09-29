import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';

class CampoWidget extends StatelessWidget {

  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onAlternarMarcacao;

  CampoWidget({
    required this.campo,
    required this.onAbrir,
    required this.onAlternarMarcacao,
  });

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhanca;

    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    }

    if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_0.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 0) {
      return Image.asset('assets/images/aberto_0.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca > 0) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    }

    if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    }

    return Image.asset('assets/images/fechado.jpeg');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onAlternarMarcacao(campo),
      child: _getImage(),
    );
  }
}