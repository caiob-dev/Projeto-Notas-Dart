import 'dart:io';

void main() {
  List<String> notas = [];
  menu(notas);
}

String getComandos() {
  print('');
  print("Digite um comando: \n 1- Adicionar notas, \n 2- Listar notas, \n 3- Sair ");

  List<String> comando = ["1", "2", "3"];
  String? entrada = '';

  entrada = stdin.readLineSync();

  if (entrada == null || !comando.contains(entrada)) { // se for nulo ou não ter as entradas da lista
    print("Comando inválido, tente novamente");
    getComandos();
  }

  return entrada!;
}


List<String> adicionarNotas(List<String> notas) {
  print("Escreva uma nota");

  String? entradaNotas = '';

  entradaNotas = stdin.readLineSync();

  if (entradaNotas == null || entradaNotas.isEmpty) {
    print("Não é possível adicionar uma nota vazia, tente novamente");
    adicionarNotas(notas);
  }

  notas.add(entradaNotas!);

  return notas;
}

void listarNotas(List<String> notas) {
  for (var i = 0; i < notas.length; i++) {
    print(notas[i]);
  }
}

void menu(List<String> notas) {
  print('');
  cabecalho();
  print('');
  String? comando = getComandos();
  print('');

  switch (comando) {
    case "1":
      adicionarNotas(notas);
      menu(notas);
    case "2":
      listarNotas(notas);
      getComandos();
    case "3":
      print("Até breve!");
    default:
    print("Comando inválido, tente novamente");
    getComandos();
  }
}

void cabecalho () {
  print("     __      _            ");
  print("  /\\ \\ \\___ | |_ __ _ ___ ");
  print (" /  \\/ / _ \\| __/ _\` / __|");
  print ("/ /\\  / (_) | || (_| \\__ \\");
  print ("\\_\\ \\/ \\___/ \\__\\__,_|___/");
  print ("                          ");
}

