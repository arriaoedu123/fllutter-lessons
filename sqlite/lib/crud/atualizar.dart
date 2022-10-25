import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/helper.dart';

class Atualizar extends StatelessWidget {
  Atualizar({super.key});

  // lógica para mostrar os dados do banco de dados e exibir na tela
  final dbHelper = DatabaseHelper.instance;

  void _atualizar() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnNome: 'Maria',
      DatabaseHelper.columnIdade: 25,
    };

    final id = await dbHelper.update(row);
    print('Registro atualizado com sucesso');
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController idadeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  child: TextFormField(
                    controller: nomeController,
                    textAlign: TextAlign.center,
                    validator: ((value) =>
                        value!.isEmpty ? "Informe o Id" : null),
                    decoration: const InputDecoration(
                      labelText: 'Informe o Id',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: TextFormField(
                    controller: nomeController,
                    textAlign: TextAlign.center,
                    validator: ((value) =>
                        value!.isEmpty ? "Informe o nome" : null),
                    decoration: const InputDecoration(
                      labelText: 'Informe o nome',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 20),
                  child: TextFormField(
                    controller: idadeController,
                    textAlign: TextAlign.center,
                    validator: ((value) =>
                        value!.isEmpty ? "Informe a idade" : null),
                    decoration: const InputDecoration(
                        labelText: 'Informe a idade',
                        labelStyle: TextStyle(fontSize: 18)),
                  ),
                )
              ],
            )),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            _atualizar();
          },
          child: const Text('Atualizar', style: TextStyle(fontSize: 30)),
        ),
      ],
    ));
  }
}
