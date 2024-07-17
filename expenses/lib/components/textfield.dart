import 'package:flutter/material.dart';

class ExpenseTextField extends StatefulWidget{
  final TextEditingController _componentController;
  final String _label;
  final String _hint;
  final TextInputType keyboardType;

  ExpenseTextField(this._componentController, this._label, this._hint, { this.keyboardType = TextInputType.text });

  @override
  State<StatefulWidget> createState() {
    return _ExpenseTextFieldState();
  }
}

class _ExpenseTextFieldState extends State<ExpenseTextField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget._componentController,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelText: widget._label,
          hintText: widget._hint,
        ),
      ),
    );
  }
}