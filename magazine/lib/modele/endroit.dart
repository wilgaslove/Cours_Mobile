// modele/endroit.dart
import 'dart:io';
import 'package:uuid/uuid.dart';


// Utilisation des  uuid pour générer un identifiant unique pour chaque endroit.
const _uuid = Uuid();


class Endroit {
final String id;
final String nom;
final File? image; // peut être null si pas d'image prise


Endroit({required this.nom, this.image}) : id = _uuid.v4();


// copier avec possibilité de remplacer l'image Dr_Love
Endroit copyWith({String? nom, File? image}) {
return Endroit(nom: nom ?? this.nom, image: image ?? this.image);
}
}