import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';

class SpendingStatisticGraph extends StatelessWidget {
  const SpendingStatisticGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Spending Statistic",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          width: 450,
          child: AspectRatio(
            aspectRatio: 1.5, // Adjust aspect ratio for medium size (1.5 instead of 2)
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 20, // Maximum Y-axis value
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  leftTitles:const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 5, // Adjust interval for Y-axis
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        const style = TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        );
                        switch (value.toInt()) {
                          case 0:
                            return const Text('Sat', style: style);
                          case 1:
                            return const Text('Sun', style: style);
                          case 2:
                            return const Text('Mon', style: style);
                          case 3:
                            return const Text('Tue', style: style);
                          case 4:
                            return const Text('Wed', style: style);
                          case 5:
                            return const Text('Thu', style: style);
                          case 6:
                            return const Text('Fri', style: style);
                          default:
                            return const Text('', style: style);
                        }
                      },
                    ),
                  ),
                ),
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: [
                  makeGroupData(0, 10, CustomColors.primaryColors, Colors.grey), // Sat
                  makeGroupData(1, 14, Colors.grey, CustomColors.primaryColors), // Sun
                  makeGroupData(2, 18, CustomColors.primaryColors, Colors.grey), // Mon
                  makeGroupData(3, 15, Colors.grey, CustomColors.primaryColors), // Tue
                  makeGroupData(4, 13, CustomColors.primaryColors, Colors.grey), // Wed
                  makeGroupData(5, 10, Colors.grey, CustomColors.primaryColors), // Thu
                  makeGroupData(6, 17, CustomColors.primaryColors, Colors.grey), // Fri
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, Color barColor1, Color barColor2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        // First segment with barColor1
        BarChartRodData(
          toY: y1, // The height for the first color segment
          color: barColor1, // First color (Primary color)
          width: 5,
          borderRadius: BorderRadius.circular(6),
        ),
        // Second segment with barColor2
        BarChartRodData(
          toY: y1 - 5, // The height for the second color segment (adjust height to create a split)
          color: barColor2, // Second color (Grey color)
          width: 5,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}

