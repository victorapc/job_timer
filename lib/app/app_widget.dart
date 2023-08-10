import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart';
import 'package:job_timer/app/core/ui/app_config_ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Job Timmer',
      builder: Asuka.builder,
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade500),
        useMaterial3: true,
        //brightness: Brightness.dark,
      ),*/
      theme: AppConfigUI.theme,
      routerConfig: Modular.routerConfig,
    );
  }
}
