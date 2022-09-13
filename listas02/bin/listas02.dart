import 'dart:math';

void main(List<String> arguments) {
  // var frutas = <String>[];

  // frutas.add('Banana');
  // frutas.add('Maçã');
  // frutas.insert(0, 'Morango');
  // frutas.insert(1, 'Abacaxi');
  // print(frutas);

  // frutas.removeRange(2, 4);
  // print(frutas);

  // var nomes = <String>[
  //   'Ana',
  //   'Lucia',
  //   'Edson',
  //   'Pedro',
  //   'Lucia',
  //   'Tina',
  //   'Mariana'
  // ];

  // nomes.removeWhere((String nome) => (nome == 'Lucia' || nome == 'Tina'));
  // print(nomes);

  // nomes.removeWhere((String n) => ['Ana', 'Mariana'].contains(n));
  // print(nomes);

  // nomes = <String>[
  //   'Ana',
  //   'Lucia',
  //   'Edson',
  //   'Pedro',
  //   'Lucia',
  //   'Tina',
  //   'Mariana'
  // ];
  // print(nomes);

  // // print(nomes..sort());

  // // print(nomes..reversed);

  // nomes.sort((x, y) => x.compareTo(y));
  // print(nomes);

  // nomes.sort((y, x) => x.compareTo(y));
  // print(nomes);

  // var lista1 = <String>['Martelo', 'Chave', 'Furadeira'];
  // var lista2 = <String>['Prego', 'Parafuso', 'Porca'];

  // // lista1.addAll(lista2);
  // // print(lista1);

  // var saida = [lista1, lista2].expand((e) => e).toList();
  // print(saida);

  // Criar um programa que implemente uma lista com 50 números aleatórios entre 0 e 100.
  var lista = List.generate(50, (index) => Random().nextInt(100));
  print('Lista completa: $lista');

  // Remover números duplicados
  lista = lista.toSet().toList();
  print('Lista filtrada com números não duplicados: $lista');

  // Excluir apenas os que forem menores que 10
  lista.removeWhere((int item) => item < 10);
  print('Lista com números menores que 10 removidos: $lista');

  // Verificar se o número 77 está na lista e mostrar o resultado da pesquisa
  print('O número 77 está presente? ${lista.contains(77)}');

  // Criar uma lista com 10 números negativos e incorporar a lista anterior
  lista.addAll(List<int>.generate(11, (int index) => index * -1));
  print('Lista com 10 números negativos adicionado $lista');

  // Mostrar o conteúdo da lista em ordem decrescente
  lista.sort((int x, int y) => y.compareTo(x));
  print('Lista em ordem decrescente: $lista');
}
