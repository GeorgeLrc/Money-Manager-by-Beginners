import 'package:flutter/material.dart';
import 'package:mobile_app_project/datetime/date_time_helper.dart';
import 'package:mobile_app_project/model/expense_item.dart';

class ExpenseData extends ChangeNotifier{

    // list of all expenses
    List<ExpenseItems> overallExpenseList = [];


    //get the expense list
    List<ExpenseItems> getAllExpenseList(){
      return overallExpenseList;
    }

    //add new expense
    void AddExpenseItem(ExpenseItems newExpense){
      overallExpenseList.add(newExpense);
      notifyListeners();
    }
    //delete the expense
    void deleteExpense(ExpenseItems expense){
      overallExpenseList.remove(expense);
    }

    //get weekday(mon , tues , etc...)
    String getDayName(DateTime dateTime){
      switch(dateTime){
        case 1:
          return 'Mon';
        case 2:
          return 'Tue';
        case 3:
          return 'Wed';
        case 4:
          return 'Thur';
        case 5:
          return 'Fri';
        case 6:
          return 'Sat';
        case 7:
          return 'Sun';
        default:
          return '';
      }
    }

    //get the date for the start of the week 
    DateTime startOfWeekDate(){

      DateTime? startofWeek;

      //get todat date
      DateTime today = DateTime.now();

      //go back to find the nearest Sunday
      for(int i = 0 ; i < 7 ; i++){
        if(getDayName(today.subtract(Duration(days: i))) == 'Sun'){
          startofWeek = today.subtract(Duration(days: i));
        } 
      }
      return startofWeek!;

    }
    /*
      convert overall expense list into daily expense list
    */
    Map<String,double> calculateDailyExpenseSummary(){
      Map<String,double> dailyExpenseSummary = {

        //date{yyymmdd} : amountTotalForDay
      };
      for(var expense in overallExpenseList){
        String date = convertDateTimeToString(expense.dateTime);
        double amount = double.parse(expense.amount);
        if(dailyExpenseSummary.containsKey(date)){
          double currentAmount = dailyExpenseSummary[date]!;
          currentAmount = amount;
          dailyExpenseSummary[date] = currentAmount;
        }
        else{
          dailyExpenseSummary.addAll({date: amount} );
        }
      }

      return dailyExpenseSummary;
    }
}