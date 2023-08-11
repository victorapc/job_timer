import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/home/widget/header_projects_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: SafeArea(
            child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Sair',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        )),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text(
                'Projetos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              expandedHeight: 100,
              toolbarHeight: 100,
              centerTitle: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
            ),
            // Fica agarrado no topo da tela caso usar scroll no app.
            SliverPersistentHeader(
              delegate: HeaderProjectsMenu(),
              pinned: true,
            ),
          ],
        ),
      ),
    );
  }
}
