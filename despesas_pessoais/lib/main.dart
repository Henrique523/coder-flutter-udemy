import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:io';

import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'components/chart.dart';

import 'models/transaction.dart';

import 'styles/theme.dart';

void main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: themeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't0',
      title: 'Conta Antiga',
      value: 400.00,
      date: DateTime.now().subtract(Duration(days: 33)),
    ),
    Transaction(
      id: 't1',
      title: 'Descrição 1',
      value: 310.76,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Descrição 2',
      value: 211.76,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't3',
      title: 'Descrição 3',
      value: 51.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Descrição 4',
      value: 50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Descrição 5',
      value: 50,
      date: DateTime.now(),
    )
  ];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * mediaQuery.textScaleFactor,
        ),
      ),
      centerTitle: true,
      actions: [
        if (isLandscape)
          IconButton(
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
            icon: Icon(_showChart ? Icons.list : Icons.bar_chart),
            color: Colors.white,
          ),
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: Icon(Icons.add),
          color: Colors.white,
        ),
      ],
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Exibir gráfico.'),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  )
                ],
              ),
            if (_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 0.8 : 0.3),
                child: Chart(_recentTransactions),
              ),
            if (!_showChart || !isLandscape)
              Container(
                height: availableHeight * (isLandscape ? 1 : 0.7),
                child: TransactionList(
                  _transactions,
                  _deleteTransaction,
                ),
              ),
          ],
        ),
      ),
    );

    Widget _getIconButton(IconData icon, Function() fn) {
      return Platform.isIOS
          ? GestureDetector(
              onTap: fn,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          : IconButton(
              color: Colors.white,
              icon: Icon(icon),
              onPressed: fn,
            );
    }

    final listIcon = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final listChart = Platform.isIOS ? CupertinoIcons.refresh : Icons.bar_chart;

    final actions = [
      if (isLandscape)
        _getIconButton(
            _showChart ? listIcon : listChart,
            () => setState(() {
                  _showChart = !_showChart;
                })),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      )
    ];

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: bodyPage,
            navigationBar: CupertinoNavigationBar(
                middle: Text('Exibir gráfico.'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions,
                )),
          )
        : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(context),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
