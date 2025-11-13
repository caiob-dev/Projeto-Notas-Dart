//Exercícios

import 'dart:io';

void main() {
  /* for (var i = 1; i <= 5; i++) {
    print(i);
  } */

  /*  List<String> nomes = ["Ana", "João", "Maria"];

  for (String nome in nomes) {
    print('Nomes: $nome');
  } 

  */
  /* String texto = "Parou! Este código não continua.";
  int index = 0;

  do {
    print(texto[index]);
    index++;
  } while (index < texto.length && texto[index - 1] != "!"); */

  List<String> nomes = [];

  List<List<double>> notas = [];

  String? acao;

  while(acao != "sair") {
    cabecalho();
    print('Escolha uma ação: registrar, listar, sair');
    acao = stdin.readLineSync();
    switch (acao) {
      case "registrar":
        registrarAluno(nomes, notas);
      break;
      case "listar":
        listarAlunos(nomes, notas);
      break;
      case "sair":
        print("Saindo...");
      break;
      default:
      print("Comando inválido");
    }
  }
}

void registrarAluno(List<String> nomes, List<List<double>> notas) {
  print('Digite o nome do aluno:');
  String? nome = stdin.readLineSync();

  if (nome != null) {
    nomes.add(nome);
    List<double> notasAlunos = [];

    while (true) {
      print('Digite uma nota para o aluno (ou "fim" para terminar):');
      String? entradaNotas = stdin.readLineSync();
      
      if (entradaNotas == 'fim') {
        break;
      } else if(entradaNotas != null) {
        double nota = double.parse(entradaNotas);
        notasAlunos.add(nota);
      }
    }
    notas.add(notasAlunos);
  } else {
    print("Nome inválido");
  }
  
}

double calcularMedia(List<double> notas) {
  double soma = 0;

  for (double nota in notas) {
    soma+= nota;
  }

  return soma / notas.length;
}

void listarAlunos(List<String> nomes, List<List<double>> notas) {
  print("Lista de alunos e suas médias");
  for (var i = 0; i < nomes.length; i++) {
    double media = calcularMedia(notas[i]);
    print("${nomes[i]}: ${media.toStringAsFixed(2)}");
  }
}


void cabecalho() {
  print("   __              _       ");
  print( "  /__\\__  ___ ___ | | __ _ ");
  print( " /_\\/ __|/ __/ _ \\| |/ _\` |");
  print( "\\__/|___/\\___\\___/|_|\\__,_|");
  print( "                           ");
} 
