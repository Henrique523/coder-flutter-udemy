import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) addTransaction;

  TransactionForm(this.addTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final text = _titleController.text;
      final doubleValue = double.tryParse(_valueController.text) ?? 0;

      if(text.isEmpty || doubleValue <= 0) {
        return;
      }

      widget.addTransaction(text, doubleValue, _selectedDate);
    }

    _showDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now(),
      ).then((value) {
        if (value == null) {
          return;
        }
        setState(() {
          _selectedDate = value;
        });
      });
    }

    return Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: _valueController,
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                textInputAction: TextInputAction.done,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: Text(
                        'Selecionar data',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => _submitForm(),
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
