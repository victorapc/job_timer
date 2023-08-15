import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:job_timer/app/modules/project/register/project_register_page.dart';

class ProjectRegisterModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<ProjectRegisterController>(
        ProjectRegisterController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => ProjectRegisterPage(
        controller: Modular.get(),
      ),
    );
  }
}
