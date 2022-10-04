// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';

void main() {
  // método principal
  // carregando o framework
  runApp(const MaterialApp(
    home: Home(), // rota de inicialização do app (start route)
  ));
}

// classe principal da aplicação
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // essa classe terá todo o conteúdo da aplicação
  // inclusive a interface do usuário
  // lógica da aplicação (campos de entrada, botões e objetos)
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  // criação do formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //variavel para receber o resultado sobre o abastecimento
  String _resultado = "";

  // lógica da aplicação (realizando o cálculo)
  // método para limpar os campos do formulário
  void _reset() {
    setState(() {
      alcoolController.text = "";
      gasolinaController.text = "";
      _resultado = "";
      _formKey = GlobalKey<FormState>();
    });
  }

  // método para calcular o preço do combustível
  void _calcular() {
    double precoAlcool =
        double.parse(alcoolController.text.replaceAll(',', '.'));
    double precoGasolina =
        double.parse(gasolinaController.text.replaceAll(',', '.'));
    double proporcao = precoAlcool / precoGasolina;

    setState(() {
      // atualizar o valor da variável
      _resultado = (proporcao >= 0.7)
          ? "Melhor abastecer com gasolina"
          : "Melhor abastecer com álcool";
    });
  }

  // código da interface
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // monta a barra superior do aplicativo
        appBar: AppBar(
          title: const Text(
            "Álcool ou Gasolina?",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // chamar o método para dar o refresh
                _reset();
              },
            )
          ],
        ),

        // criando o corpo do formulário
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
          child: Form(
            key: _formKey, // associando o formulário ao controle
            child: Column(
              // coluna para inserir controles
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // inserindo um ícone
                Icon(
                  Icons.local_gas_station,
                  size: 80,
                  color: Colors.blue,
                ),
                // inserindo um campo de texto
                TextFormField(
                  controller: alcoolController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number, // só via celular
                  // validação dos dados
                  validator: (value) =>
                      value!.isEmpty ? "Insira o valor do álcool" : null,
                  decoration: const InputDecoration(
                    labelText: "Preço do álcool",
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                TextFormField(
                  controller: gasolinaController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number, // só via celular
                  // validação dos dados
                  validator: (value) =>
                      value!.isEmpty ? "Insira o valor da gasolina" : null,
                  decoration: const InputDecoration(
                    labelText: "Preço da gasolina",
                  ),
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                // inserindo um botão para calcular
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: SizedBox(
                      height: 50,
                      child: RawMaterialButton(
                        onPressed: () {
                          // verificar se os campos estão preenchidos
                          if (_formKey.currentState!.validate()) {
                            // chamar o método para calcular
                            _calcular();
                          }
                        },
                        fillColor: Colors.blue,
                        child: const Text(
                          "Calcular",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      )),
                ),
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
          ),
        ));
  }
}
