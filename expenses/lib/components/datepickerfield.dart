import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget{
  final TextEditingController _componentController;
  final TextInputType keyboardType;
  DateTime dateTimeValue = DateTime.now();

  DatePickerField(this._componentController, { this.keyboardType = TextInputType.text });

  @override
  State<StatefulWidget> createState() {
    return _DatePickerFieldState();
  }

}

class _DatePickerFieldState extends State<DatePickerField> {

  void _onTapDatePicker(BuildContext context) async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate:DateTime(2023),
      lastDate: DateTime(2026)
    );
    if(pickedDate != null ){
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
          widget._componentController.text = formattedDate; //set foratted date to TextField value. 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget._componentController,
        decoration: const InputDecoration( 
            icon: Icon(Icons.calendar_today), //icon of text field
            labelText: "Enter Date" //label text of field
        ),
        readOnly: true,  // when true user cannot edit text 
        onTap: () => _onTapDatePicker(context)
      ),
    );
  }

}