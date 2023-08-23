import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProjectPieChart extends StatelessWidget {
  final int projectEstimate;
  final int totalTask;

  const ProjectPieChart(
      {super.key, required this.projectEstimate, required this.totalTask});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).primaryColor;

    final residual = (projectEstimate - totalTask);

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
                  value: totalTask.toDouble(),
                  color: theme,
                  showTitle: true,
                  title: '${totalTask}h',
                  titleStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: residual.toDouble(),
                  color: Theme.of(context).primaryColorLight,
                  showTitle: true,
                  title: '${residual}h',
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
              '${projectEstimate}h',
              style: TextStyle(
                  fontSize: 25, color: theme, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
