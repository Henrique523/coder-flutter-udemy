import 'package:flutter/material.dart';
import 'package:pomodoro/components/rounded_button.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? incrementaTempo;
  final void Function()? decrementaTempo;

  const EntradaTempo({
    Key? key,
    required this.valor,
    required this.titulo,
    this.incrementaTempo,
    this.decrementaTempo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          this.titulo,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              icon: Icons.arrow_downward,
              onPressed: decrementaTempo,
            ),
            Text(
              '${this.valor} min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            RoundedButton(
              icon: Icons.arrow_upward,
              onPressed: incrementaTempo,
            ),
          ],
        ),
      ],
    );
  }
}
