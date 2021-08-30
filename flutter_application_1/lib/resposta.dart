import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onSurface: Colors.blue,
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          elevation: 6,
        ),
        onPressed: onSelecao, 
        child: Text(texto),
      ),
    );
  }
}