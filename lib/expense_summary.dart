import 'package:flutter/material.dart';
import 'package:mobile_app_project/bar%20graph/bar_graph.dart';
import 'package:mobile_app_project/data/expense_data.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget{
  
  final DateTime startOfWeek;
  const ExpenseSummary({super.key , required this.startOfWeek});
  
  @override
  Widget build(BuildContext context) {
    
      // return Consumer<ExpenseData>(
      //   builder: (context , value , child ) => SizedBox(
      //     height: 200,
      //     child: BarGraph(
      //       maxy: maxy, 
      //       sunAmount: sunAmount, 
      //       monAmount: monAmount, 
      //       tueAmount: tueAmount, 
      //       wedAmount: wedAmount, 
      //       thurAmount: thurAmount, 
      //       friAmount: friAmount, 
      //       satAmount: satAmount
      //       ),
      //   ),
      // );
      return Container();
       
  }


}