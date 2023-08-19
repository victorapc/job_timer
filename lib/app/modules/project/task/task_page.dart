import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_timer/app/modules/project/task/controller/task_controller.dart';
import 'package:validatorless/validatorless.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;

  const TaskPage({super.key, required this.controller});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _durationEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _durationEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar nova task',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameEC,
                decoration: const InputDecoration(
                  label: Text(
                    'Nome da Task',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                validator: Validatorless.required('Nome obrigatório.'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _durationEC,
                keyboardType: TextInputType.number,
                maxLength: 3,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                    //RegExp(r'[0-9]+[,.]{0,1}[0-9]*'),
                    // Ou essa experessão caso não queira usar
                    RegExp(r'[0-9]'),
                  ),
                  TextInputFormatter.withFunction(
                    (oldValue, newValue) => newValue.copyWith(
                      text: newValue.text.replaceAll(',', '.'),
                    ),
                  ),
                ],
                decoration: const InputDecoration(
                  label: Text(
                    'Duração da Task',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Duração obrigatória'),
                  Validatorless.number('Somente números'),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {}
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
