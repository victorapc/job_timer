import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/project_detail_page.dart';
import 'package:job_timer/app/view_models/project_model.dart';

class ProjectDetailModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ProjectDetailController>(ProjectDetailController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) {
      final ProjectModel projectModel = r.args.data;

      return ProjectDetailPage(
        controller: Modular.get()..setProject(projectModel),
      );
    });
  }
}
