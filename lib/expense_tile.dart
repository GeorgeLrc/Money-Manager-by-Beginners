// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Expense_tile extends StatelessWidget{

  final String name;
  final String amount;
  final DateTime dateTime;
  const Expense_tile({super.key , required this.amount , required this.dateTime, required this.name});


  @override
  Widget build(BuildContext context) {

    return ListTile(
              title: Text(name),
              subtitle: Text("${dateTime.day} / ${dateTime.month} / ${dateTime.year}"),
              trailing: Text(amount),
              );

  }

}