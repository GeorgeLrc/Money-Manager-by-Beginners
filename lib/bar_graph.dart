import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/bar%20graph/bar_data.dart';

class BarGraph extends StatelessWidget{
  
  final double?  maxy;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  const BarGraph({
    super.key , 
    required this.maxy , 
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thurAmount,
    required this.friAmount,
    required this.satAmount

  });
  
  @override
  Widget build(BuildContext context) {
    //initialize the bar data
    BarData mybarData = BarData(
      sunAmount: sunAmount, 
      monAmount: monAmount, 
      tueAmount: tueAmount, 
      wedAmount: wedAmount, 
      thurAmount: thurAmount, 
      friAmount: friAmount, 
      satAmount: satAmount);

      mybarData.initializeBarData();

      return BarChart(
        BarChartData(
          maxY: maxy,
          minY: 0,
          barGroups: mybarData.barData
          .map( 
            (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(toY: data.y)
              ]
            )
            )
          .toList(),
        ),
      );
  }


}