void main(List<String> arguments) {
  var pares = <int>[];
  var impares = <int>[];

  for (var i = 1; i <= 10; i++) {
    var calculo = 7 * i;

    if (calculo % 2 == 0) {
      pares.add(calculo);
    } else {
      impares.add(calculo);
    }
  }

  print('--- Tabuada do 7 ---');
  print('Pares: $pares');
  print('Ímpares: $impares');
}
