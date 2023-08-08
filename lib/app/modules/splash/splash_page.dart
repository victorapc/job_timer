import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  //Parou na aula 35 min
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Splash',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
