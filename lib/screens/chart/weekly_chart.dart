// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:solulab6/utils/common_widgets.dart';

class WeeklyChart extends StatelessWidget {
  final List<Map<String, dynamic>> chartData;

  const WeeklyChart({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 6, // title space keeping it 4 for now
                    child: customText(
                      text: chartData[value.toInt()]['day'],
                      color: const Color(0xff8F92A1),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          alignment: BarChartAlignment.spaceAround,
          maxY: 188,
          barGroups: List.generate(chartData.length, (index) {
            final data = chartData[index];
            return makeGroupData(
              index,
              data['income'].toDouble(),
              data['expense'].toDouble(),
            );
          }),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double income, double expense) {
    double total = income + expense + 8;
    double y0 = (income / total) * 160;
    double y1 = y0 + 8;
    double y2 = 160;

    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        if (y0 > 0)
          BarChartRodData(
            toY: y0,
            color: const Color(0xff4CD080),
            width: 10,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(8),
            ),
          ),
        if (y1 < 160)
          BarChartRodData(
            fromY: y0,
            toY: y1,
            color: Colors.white,
            width: 10,
            borderRadius: BorderRadius.zero,
          ),
        if (y1 < 160)
          BarChartRodData(
            fromY: y1,
            toY: y2,
            color: const Color(0xffFFAE58),
            width: 10,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
              bottom: Radius.circular(8),
            ),
          ),
      ],
    );
  }

  double getMaxTotal() {
    return chartData
            .map((data) => (data['income'] + data['expense']).toDouble())
            .reduce((a, b) => a > b ? a : b) *
        1.1;
  }
}
