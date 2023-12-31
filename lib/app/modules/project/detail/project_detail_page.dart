import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/job_timer_icons.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chart.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tile.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro ao carregar dados.');
          }
        },
        builder: (context, state) {
          final projectModel = state.projectModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(
                child: Text(
                  'Carregando Projeto...',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            case ProjectDetailStatus.loading:
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case ProjectDetailStatus.complete:
              return buildProjectDetail(context, projectModel!, controller);
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return buildProjectDetail(context, projectModel, controller);
              }

              return const Center(
                child: Text(
                  'Erro ao carregando projeto!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
          }
        },
      ),
    );
  }
}

Widget buildProjectDetail(BuildContext context, ProjectModel projectModel,
    ProjectDetailController controller) {
  final totalTask = projectModel.tasks.fold<int>(0, (totalValue, task) {
    return totalValue += task.duration;
  });

  return CustomScrollView(
    slivers: [
      ProjectDetailAppbar(
        context: context,
        projectModel: projectModel,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
              child: ProjectPieChart(
                projectEstimate: projectModel.estimate,
                totalTask: totalTask,
              ),
            ),
            ...projectModel.tasks.map(
              (task) => ProjectTaskTile(
                task: task,
              ),
            )
          ],
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Visibility(
              visible: projectModel.status != ProjectStatus.finalizado,
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.finishProject();
                },
                icon: const Icon(JobTimerIcons.ok_circled2),
                label: const Text('Finalizar Projeto'),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
