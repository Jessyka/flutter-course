import 'package:expenses/components/itemList.dart';
import 'package:expenses/models/expense.dart';
import 'package:expenses/screens/add_expense.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Expense> _expenses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: 
        _expenses.length > 0 ? 
        Column(
          children: [
            for(var item in _expenses ) 
              ItemList(item, _removeExpense)])
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nenhuma transação cadastrada.',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _pushAddScreen(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _removeExpense(Expense expense){
    setState(() {
      _expenses.remove(expense);
    });
  }

  void _pushAddScreen(BuildContext context) {
    final value = Navigator.of(context).push(MaterialPageRoute<Expense>(
    builder: (BuildContext context) {
      return AddExpense();
      },
    ));

    value.then((value) => {
      if(value != null) {
        setState(() {
          _expenses.add(value);
        })
      }
    });
  }
}