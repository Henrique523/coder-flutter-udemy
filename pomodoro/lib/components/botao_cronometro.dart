import 'package:flutter/material.dart';

class BotaoCronometro extends StatelessWidget {
  final IconData icon;
  final String texto;
  final void Function() onPressed;

  BotaoCronometro({
    Key? key,
    required this.icon,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        textStyle: TextStyle(
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          Text(texto),
        ],
      ),
    );
  }
}
