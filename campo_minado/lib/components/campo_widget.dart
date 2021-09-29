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
    if (campo.aberto && campo.minado && campo.explodido) {
      return Image.asset('assets/images/bomba_0.jpeg');
    }

    if (campo.aberto && campo.minado) {
      return Image.asset('assets/images/bomba_0.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 0) {
      return Image.asset('assets/images/aberto_0.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 1) {
      return Image.asset('assets/images/aberto_1.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 2) {
      return Image.asset('assets/images/aberto_2.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 3) {
      return Image.asset('assets/images/aberto_3.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 4) {
      return Image.asset('assets/images/aberto_4.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 5) {
      return Image.asset('assets/images/aberto_5.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 6) {
      return Image.asset('assets/images/aberto_6.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 7) {
      return Image.asset('assets/images/aberto_7.jpeg');
    }

    if (campo.aberto && ! campo.minado && ! campo.explodido && campo.qtdeMinasNaVizinhanca == 8) {
      return Image.asset('assets/images/aberto_8.jpeg');
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