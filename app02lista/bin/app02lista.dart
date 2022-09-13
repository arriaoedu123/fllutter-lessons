void main(List<String> arguments) {
  var nomes = <String>['João', 'Maria', 'José'];
  print(nomes);

  print(nomes[0]);
  print(nomes[1]);
  print(nomes[2]);

  print("Quantidade de nomes: ${nomes.length}");

  for (var i = 0; i < nomes.length; i++) {
    print("Índice $i: ${nomes[i]}");
  }

  for (var nome in nomes) {
    print(nome);
  }

  var lista = <String>[];

  lista.add('João');
  lista.add('Maria');
  print(lista);

  lista.insert(0, 'José');
  print(lista);

  var lista1 = <String>['João', 'Maria', 'José'];
  var lista2 = <String>['Duarte', 'Silva', 'Costa'];

  for (var first in lista1.reversed.toList()) {
    lista2.insert(0, first);
  }

  print(lista2);

  var frutas = <String>[];

  frutas
    ..add('Banana')
    ..add('Maçã')
    ..add('Uva');
  print(frutas);

  var bebidas = <String>[];

  bebidas.addAll(['Cerveja', 'Vinho']);
  print(bebidas);

  bebidas.insertAll(0, ['Refrigerante', 'Suco']);
  print(bebidas);

  bebidas.remove('Refrigerante');
  print(bebidas);

  bebidas.removeAt(0);
  print(bebidas);

  bebidas.removeLast();
  print(bebidas);
}
