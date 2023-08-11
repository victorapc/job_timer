import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/database/database.dart';
import 'package:job_timer/app/database/database_impl.dart';
import 'package:job_timer/app/modules/home/home_module.dart';
import 'package:job_timer/app/modules/login/login_module.dart';
import 'package:job_timer/app/modules/services/auth/auth_service.dart';
import 'package:job_timer/app/modules/services/auth/auth_service_impl.dart';
import 'package:job_timer/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<AuthService>(AuthServiceImpl.new);
    i.addLazySingleton<Database>(DatabaseImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashPage());
    r.module('/login', module: LoginModule());
    r.module('/home', module: HomeModule());
  }
}
