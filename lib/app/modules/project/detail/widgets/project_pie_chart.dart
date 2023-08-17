import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectPieChart extends StatelessWidget {
  const ProjectPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryColor;

    return SizedBox(
      width: 200,
      height: 200,
      // Coloca 1 objeto acima do outro. Sobrepõe.
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: 50,
                  color: theme,
                  showTitle: true,
                  title: '50h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: 150,
                  color: Theme.of(context).primaryColorLight,
                  showTitle: true,
                  title: '150h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '200h',
              style: TextStyle(
                  fontSize: 25, color: theme, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
