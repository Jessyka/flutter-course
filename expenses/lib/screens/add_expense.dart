
import 'package:expenses/components/datepickerfield.dart';
import 'package:expenses/components/textfield.dart';
import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget{
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Despesa')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExpenseTextField(_descriptionController, "Despesa", "despesa", keyboardType: TextInputType.text),
          ExpenseTextField(_amountController, "Valor", "0.00", keyboardType: TextInputType.number),
          DatePickerField(_dateController, keyboardType: TextInputType.datetime),
          TextButton(
            child: Text('Nova Transação'),
            onPressed: () => _returnToHomeScreen(context),)
        ],
      ),
    );
  }

  void _returnToHomeScreen(BuildContext context){
    final description = _descriptionController.text;
    final amount = double.tryParse(_amountController.text);
    final date = DateTime.parse(_dateController.text);
    
    if (description == null || amount == null || date == null) {
      return;
    }

    Expense expense = new Expense(description, amount, date);

    Navigator.pop(context, expense);
  }
}