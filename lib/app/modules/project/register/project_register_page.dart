import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project/register/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterState>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterState.success:
            Navigator.pop(context);
            break;
          case ProjectRegisterState.failure:
            AsukaSnackbar.alert('Erro ao salvar o projeto.').show();
            break;
          default:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Criar um novo projeto',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEC,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    label: Text(
                      'Nome do Projeto',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  validator: Validatorless.required('Nome Obrigatório.'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _estimateEC,
                  keyboardType: TextInputType.number,
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
                      'Estimativas de Horas',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  validator: Validatorless.multiple(
                    [
                      Validatorless.required('Estimativa obrigatória.'),
                      Validatorless.number('Estimativa obrigatória.'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocSelector<ProjectRegisterController, ProjectRegisterState,
                    bool>(
                  bloc: widget.controller,
                  selector: (state) => state == ProjectRegisterState.loading,
                  builder: (context, showLoading) {
                    return Visibility(
                      visible: showLoading,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () async {
                      final formValid =
                          _formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        final name = _nameEC.text;
                        final estimate = int.parse(_estimateEC.text);

                        await widget.controller.register(name, estimate);
                      }
                    },
                    child: const Text(
                      'SALVAR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
