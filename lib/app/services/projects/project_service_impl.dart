import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/view_models/project_model.dart';

import './project_service.dart';

class ProjectServiceImpl implements ProjectService {
  final ProjectRepository _projectsRepository;

  ProjectServiceImpl({
    required ProjectRepository projectsRepository,
  }) : _projectsRepository = projectsRepository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _projectsRepository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _projectsRepository.findByStatus(status);

    return projects.map(ProjectModel.fromEntity).toList();
  }
}
