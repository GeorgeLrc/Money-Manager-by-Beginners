// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_app_project/component/expense_summary.dart';
import 'package:mobile_app_project/component/expense_tile.dart';
import 'package:mobile_app_project/data/expense_data.dart';
import 'package:mobile_app_project/model/expense_item.dart';
import 'package:mobile_app_project/page/Setting.dart';
import 'package:mobile_app_project/page/chat.dart';
import 'package:mobile_app_project/page/dashboard.dart';
import 'package:mobile_app_project/page/profile.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  int currentTab = 0;
  final List<Widget> screens = [
    Dashboard(),
    Chat(),
    Profile(),
    Setting(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  //text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  void addNewExpense() {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Record your expense"), 
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            //

            //expense name
            TextField(
              controller: newExpenseNameController,
            ),

            //expense amount 
            TextField(
              controller: newExpenseAmountController,
            ),
        ],
        ),
        actions: [

          //save buttom
          MaterialButton(
            onPressed: save,
            child: Text('Save'),  
          ),
          //cancle buttom
         MaterialButton(
            onPressed: cancle,
            child: Text('Cancle'),  
          ),
        ],
      ),
    );
  }  

  void save(){
    ExpenseItems newExpense = ExpenseItems(
      name: newExpenseNameController.text, 
      amount: newExpenseAmountController.text, 
      dateTime: DateTime.now(),
      );
      //add the new expense
    Provider.of<ExpenseData>(context , listen: false).AddExpenseItem(newExpense);
    Navigator.pop(context);
    clear();
  }
  void cancle(){
    Navigator.pop(context);
    clear();
  }
  //clear coltroller
  void clear(){
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }


    @override
  Widget build(BuildContext context){

    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewExpense,

        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Dashboard();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dashboard , color: currentTab == 0 ? Colors.black : Colors.grey,),
                      Text("Dashboard" , style: TextStyle(color: currentTab == 0 ? Colors.black : Colors.grey)),
                    ],

                  ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Chat();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat , color: currentTab == 1 ? Colors.black : Colors.grey,),
                      Text("Chat" , style: TextStyle(color: currentTab == 1 ? Colors.black : Colors.grey)),
                    ],

                  ),
                  ),
                  ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Profile();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person , color: currentTab == 2 ? Colors.black : Colors.grey,),
                      Text("Profile" , style: TextStyle(color: currentTab == 2 ? Colors.black : Colors.grey)),
                    ],

                  ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Setting();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.settings , color: currentTab == 3 ? Colors.black : Colors.grey,),
                      Text("Setting" , style: TextStyle(color: currentTab == 3 ? Colors.black : Colors.grey)),
                    ],

                  ),
                  ),
                  ],
              ),
            ]
            ),
            
            
        ),
      ),
    );

}



  // @override
  // Widget build(BuildContext context){

    // return Consumer<ExpenseData>(
    //   builder: (context , value , child) => Scaffold(
    //     backgroundColor: Colors.grey[300],
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: addNewExpense,
    //       child: Icon(Icons.add),
    //       ),
    //       body: ListView( 
    //         children: [

    //         //weekly summary
    //        // ExpenseSummary(startOfWeek: value.startOfWeekDate()),

    //         //expense list  
    //         ListView.builder(
    //           shrinkWrap: true,
    //           physics: const NeverScrollableScrollPhysics(),
    //         itemCount: value.getAllExpenseList().length,
    //         itemBuilder: (context , index)=> Expense_tile(
    //           amount: value.getAllExpenseList()[index].amount, 
    //           dateTime: value.getAllExpenseList()[index].dateTime, 
    //           name: value.getAllExpenseList()[index].name)
    //         ),
    //         ],
    //       )
    //       ),
    //   );
  }




//  This is for old layout.

// 