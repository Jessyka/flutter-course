import 'package:expenses/models/expense.dart';
import 'package:expenses/screens/add_expense.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';


class HomePage extends StatefulWidget {

  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Expense> _expenses = [
    new Expense('Conta de luz', 111.20, DateTime.now())
  ];

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
      if(value != null) _saveExpense(value)
    });
  }

  void _saveExpense(Expense expense){
    setState(() {
      _expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: 
        _expenses.length > 0 ? ListView(
          children:  <Widget> [for(var item in _expenses ) ListTile(
              leading: Text('R\$ ${item.value.toStringAsFixed(2)}'),
              title: Text(item.description),
              subtitle: Text(formatDate(item.transaction_date, [dd, '/', mm, '/', yyyy])),
              trailing: TextButton( 
                onPressed: () => _removeExpense(item),
                child: Icon(Icons.highlight_remove))
            )],
        )
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}