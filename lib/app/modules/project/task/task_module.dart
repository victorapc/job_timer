import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/task/controller/task_controller.dart';
import 'package:job_timer/app/modules/project/task/task_page.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<TaskController>(TaskController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) {
      final ProjectModel projectModel = r.args.data;

      return TaskPage(
        controller: Modular.get()..setProject(projectModel),
      );
    });
  }
}
