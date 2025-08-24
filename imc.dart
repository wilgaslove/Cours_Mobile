import 'dart:io';

void main() {
  // 1. Message de bienvenue
  print("Bienvenue dans l’application de calcul d'IMC !");

  // 2. Demander le poids
  stdout.write("Entrez votre poids en kg : ");
  double poids = double.parse(stdin.readLineSync()!);

  // 4. Demander la taille
  stdout.write("Entrez votre taille en mètres : ");
  double taille = double.parse(stdin.readLineSync()!);

  // 6. Calcul de l'IMC
  double imc = poids / (taille * taille);

  // 7. Diagnostic selon les intervalles
  String diagnostic;
  if (imc < 18.5) {
    diagnostic = "Sous-poids";
  } else if (imc < 25) {
    diagnostic = "Poids normal";
  } else if (imc < 30) {
    diagnostic = "Surpoids";
  } else {
    diagnostic = "Obésité";
  }

  // 8. Affichage du résultat
  print("\nVotre IMC est : ${imc.toStringAsFixed(2)}");
  print("Diagnostic : $diagnostic");
 }
0