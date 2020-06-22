import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LiveCharts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LiveChartsState();
}

class LiveChartsState extends State<LiveCharts> {
  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 100,
        // elevation: 0,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color:Colors.transparent,
        child: BarChart(
          BarChartData(
            backgroundColor: Colors.transparent,
            alignment: BarChartAlignment.spaceAround,
            maxY: 20,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 0,
                // getTooltipItem: (
                //   BarChartGroupData group,
                //   int groupIndex,
                //   BarChartRodData rod,
                //   int rodIndex,
                // ) {
                //   return BarTooltipItem(
                //     rod.y.round().toString(),
                //     TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   );
                // },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(
                    color: const Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return '';
                    case 1:
                      return '';
                    case 2:
                      return '';
                    case 3:
                      return '';
                    case 4:
                      return '';
                    case 5:
                      return '';
                    case 6:
                      return '';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(y: 8, color: Colors.lightBlueAccent, borderRadius:BorderRadius.circular(0) )],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(y: 0, color: Colors.red, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(y: 14, color: Colors.pink, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(y: 0, color: Colors.green, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 4,
                  barRods: [BarChartRodData(y: 13, color: Colors.orange, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 5,
                  barRods: [BarChartRodData(y: 0, color: Colors.lightBlueAccent, borderRadius:BorderRadius.circular(0) )],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 6,
                  barRods: [BarChartRodData(y: 10, color: Colors.red, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 7,
                  barRods: [BarChartRodData(y: 0, color: Colors.pink, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 8,
                  barRods: [BarChartRodData(y: 15, color: Colors.green, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
              BarChartGroupData(
                  x: 9,
                  barRods: [BarChartRodData(y: 0, color: Colors.orange, borderRadius:BorderRadius.circular(0))],
                  showingTooltipIndicators: [0]),
            ],
          ),
        ),
      );
  }
}