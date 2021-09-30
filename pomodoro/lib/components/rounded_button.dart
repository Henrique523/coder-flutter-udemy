import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;

  const RoundedButton({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    
    return Observer(
      builder: (_) => ElevatedButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          primary: store.estaTrabalhando() ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
