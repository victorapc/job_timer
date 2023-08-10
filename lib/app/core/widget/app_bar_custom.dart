import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const AppBarCustom({
    super.key,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //backgroundColor: AppConfigUI.theme.primaryColor,
      title: Align(
        alignment: Alignment.center,
        child: Text(
          titulo,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
