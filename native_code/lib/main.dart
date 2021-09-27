import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _a = 0;
  int _b = 0;
  int _sum = 0;

  void sum() {
    setState(() {
      _sum = _a + _b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nativo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Soma...$_sum',
                style: const TextStyle(fontSize: 30),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _a = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  labelText: 'A',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _b = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  labelText: 'B',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: sum,
                child: const Text('Soma'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
