import 'package:flutter/material.dart';

import 'adaptative_button.dart';
import 'adaptative_textfield.dart';
import 'adaptative_datepicker.dart';

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

      if (text.isEmpty || doubleValue <= 0) {
        return;
      }

      widget.addTransaction(text, doubleValue, _selectedDate);
    }

    _onDateChanged(DateTime value) {
      setState(() {
        _selectedDate = value;
      });
    }

    return SingleChildScrollView(
      child: Card(
          elevation: 6,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                AdaptativeTextField(
                  label: 'Título',
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                ),
                AdaptativeTextField(
                  label: 'Valor (R\$)',
                  controller: _valueController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                ),
                AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: _onDateChanged,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButton(
                      label: 'Nova Transação',
                      onPressed: () => _submitForm(),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
