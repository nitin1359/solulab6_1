// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:solulab6/utils/common_widgets.dart';

class MonthlyChart extends StatelessWidget {
  final List<Map<String, dynamic>> chartData;

  const MonthlyChart({super.key, required this.chartData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: BarChart(
        BarChartData(
          maxY: 5000,
          minY: 0,
          barTouchData: BarTouchData(
            enabled: false,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (barGroup, group, rod, rodIndex) {
                return BarTooltipItem(
                  barGroup.x.toInt().toString(),
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 1000,
                getTitlesWidget: (value, meta) {
                  String title = '';
                  if (value == 0) {
                    title = '\$0';
                  } else if (value == 1000) {
                    title = '\$1k';
                  } else if (value == 3000) {
                    title = '\$3k';
                  } else if (value == 5000) {
                    title = '\$5k';
                  }

                  if (title.isNotEmpty) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 8,
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Color(0xff8F92A1),
                          fontSize: 12,
                        ),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return customText(
                    text: chartData[value.toInt()]['week'],
                    color: const Color(0xff8F92A1),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 1000,
            checkToShowHorizontalLine: (value) {
              return value == 0 ||
                  value == 1000 ||
                  value == 3000 ||
                  value == 5000;
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Color(0xffE0E0E0),
                strokeWidth: 1,
                dashArray: [5, 5],
              );
            },
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                  y: 5000,
                  color: Color(0xffE0E0E0),
                  strokeWidth: 1,
                  dashArray: [5, 5]),
            ],
          ),
          barGroups: chartData.asMap().entries.map((entry) {
            final index = entry.key;
            final income = entry.value['income'];
            final expense = entry.value['expense'];
            return BarChartGroupData(
              x: index.toInt(),
              barRods: [
                BarChartRodData(
                  toY: income.toDouble(),
                  color: const Color(0xff4CD080),
                  width: 16,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                BarChartRodData(
                  toY: expense.toDouble(),
                  color: const Color(0xffFFAE58),
                  width: 16,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
