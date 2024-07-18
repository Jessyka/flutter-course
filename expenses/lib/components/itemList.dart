import 'package:date_format/date_format.dart';
import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget{
  final Expense expense;
  final Function(Expense expense) removeItem;

  
  ItemList(this.expense, void Function(Expense expense) this.removeItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: <Widget> [
        Expanded(
          child: Container(
            width: 60.0,
            height:60.0,
            child: Center(child: 
              Text('R\$ ${expense.value.toStringAsFixed(2)}', 
                textAlign: TextAlign.center, 
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12))),
            decoration: new BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
            ),
          ),
          flex: 2
        ),
        Expanded(
          child: Column(
            children: [
              Text(expense.description, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
              Text(formatDate(expense.transactionDate, [dd, '/', mm, '/', yyyy]), textAlign: TextAlign.left)
            ],),
          flex: 6,
        ),
        Expanded(
          child: Container(
            child: TextButton( 
                onPressed: () => removeItem(expense),
                child: Icon(Icons.highlight_remove))
            ),
          flex: 2)
      ],) 
    );
  }
}