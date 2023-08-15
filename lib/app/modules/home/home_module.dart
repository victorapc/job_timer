import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';
import 'package:job_timer/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<HomeController>(HomeController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => HomePage(
        controller: Modular.get()..loadProjects(),
      ),
    );
  }
}
