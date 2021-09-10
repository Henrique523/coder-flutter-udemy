import 'package:flutter/material.dart';
import '../providers/counter.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo contador'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(CounterProvider.of(context)!.state.value.toString()),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  CounterProvider.of(context)!.state.inc();
                });
              },
              icon: Icon(Icons.add),
            ),
          ),
          Center(
            child: IconButton(
              onPressed: () {
                setState(() {
                  CounterProvider.of(context)!.state.dec();
                });
              },
              icon: Icon(Icons.remove),
            ),
          )
        ],
      ),
    );
  }
}
