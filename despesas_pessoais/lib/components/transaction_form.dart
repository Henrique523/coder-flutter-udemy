import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) addTransaction;

  TransactionForm(this.addTransaction);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final text = titleController.text;
      final doubleValue = double.tryParse(valueController.text) ?? 0;

      if(text.isEmpty || doubleValue <= 0) {
        return;
      }

      widget.addTransaction(text, doubleValue);
    }

    return Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                ),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              TextField(
                controller: valueController,
                decoration: InputDecoration(
                  labelText: 'Valor (R\$)',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                textInputAction: TextInputAction.done,
                onSubmitted: (value) => _submitForm(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _submitForm(),
                    child: Text(
                      'Nova Transação',
                      style: TextStyle(color: Colors.purple),
                    ),
                    style: TextButton.styleFrom(primary: Colors.purple),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
