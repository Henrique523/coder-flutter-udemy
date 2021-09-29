import 'package:flutter/material.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function()? onReiniciar;

  ResultadoWidget({
    this.venceu,
    this.onReiniciar,
  });

  Color _getCor() {
    if(venceu == null) {
      return Colors.yellow;
    }

    if (venceu == true) {
      return Colors.green.shade300;
    }
     
    return Colors.red.shade300;
  }

  IconData _getIcon() {
    if(venceu == null) {
      return Icons.sentiment_satisfied;
    }

    if (venceu == true) {
      return Icons.sentiment_very_satisfied;
    }
     
    return Icons.sentiment_very_dissatisfied;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getCor(),
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(_getIcon()),
              onPressed: onReiniciar,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}
