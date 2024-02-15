// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget{

  @override
  _DashboardState createState() => _DashboardState();

}

class _DashboardState extends State<Dashboard>{

  @override
  Widget build(BuildContext context){
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Dashboard"),
    //   ),
    //   body: Center(
    //     child: Text("Dashboard Screen" , style: TextStyle(fontSize: 40),),
        
    //     ),
    // );
    return Container(
      width: 500,
      height: 500,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Record your Expense" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 20), // Add some space below the title
          
          TextFormField(
            decoration: InputDecoration(labelText: 'Select Category'), // Label for Name field
          ),
          SizedBox(height: 20), // Add some space between fields
          
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter the amount'), // Label for Amount field
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(labelText: 'Notes'), // Label for Name field
          ),
          SizedBox(height: 20), // Add some space between fields
          
          TextFormField(
            decoration: InputDecoration(labelText: 'Date'), // Label for Amount field
          ),

          SizedBox(height: 20),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   ElevatedButton(
                onPressed: (){}, 
                child: Text("Cancle"),
                ),
                 SizedBox(width: 20),
                ElevatedButton(
                onPressed: (){}, 
                child: Text("Save"),
                )
                ],
              ),
            ),
            ]),
          );
        
  }

}