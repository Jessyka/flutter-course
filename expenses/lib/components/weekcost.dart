import 'package:expenses/models/expense.dart';
import 'package:flutter/material.dart';

class WeekCostComponent extends StatelessWidget{

  final List<Expense> expenses;
  final Map<int,String> weekDays = {
    1: 'S',
    2: 'T',
    3: 'Q',
    4: 'Q',
    5: 'S',
    6: 'S',
    7: 'D',
  };

  WeekCostComponent(this.expenses);

  double _getTotalCost(){
    double total = 0;
    for(Expense item in this.expenses){
        total += item.value;
    }

    return total;
  }

  // Map<DateTime, double> _getListGroupedByDate(){
  //   return this.weekCost.fold<Map<DateTime, double>>({}, (costByWeekDay, item) {
  //     costByWeekDay[item.transactionDate] = costByWeekDay[item.transactionDate] != null? costByWeekDay[item.transactionDate]! + item.value : item.value;
    
  //   return costByWeekDay;
  // });

  // }

  double _getCostByWeekDay(int weekday){
    double totalCost = 0;
    for(Expense item in this.expenses){
      if(item.transactionDate.weekday == weekday)
        totalCost += item.value;
    }

    return totalCost;

  }

  @override
  Widget build(BuildContext context) {
    final double totalCost = _getTotalCost();

    return Row(
      children: [
            for(MapEntry<int, String> item in weekDays.entries ) 
              Expanded(
                flex: 1,
                child: Column( 
                children: 
                [
                  Text(item.value),
                  SizedBox(height: 5),
                  Container(
                    height: 60,
                    width: 10,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0
                          ),
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(220, 220, 220, 1)
                          ),
                        ),
                        FractionallySizedBox(
                          heightFactor: (_getCostByWeekDay(item.key) / totalCost),
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromRGBO(165, 42, 42, 0.7) 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(_getCostByWeekDay(item.key).toStringAsFixed(2))
                ],)
              )
      ]);
  }
}