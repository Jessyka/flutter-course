import 'package:expenses/components/itemList.dart';
import 'package:expenses/components/weekcost.dart';
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
  
  List<Expense> _expenses = [ new Expense('Luz', 52.2, DateTime.now())];

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
            SizedBox(height: 20),
            WeekCostComponent(_expenses),
            SizedBox(height: 20),
            for(var item in _expenses ) 
              ItemList(item, _removeExpense)])
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nenhuma transação cadastrada.',
            ),
            SizedBox(height: 20),
            Container(
              child: Image.asset('assets/images/waiting.png',
              height: 200))
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