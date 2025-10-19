import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modele/endroit.dart';


// StateNotifier qui gère la liste des Endroit
class EndroitsUtilisateur extends StateNotifier<List<Endroit>> {
EndroitsUtilisateur() : super([]);


// Ajouter un endroit (nom + option image)
void ajoutEndroit(String nom, {File? image}) {
final e = Endroit(nom: nom, image: image);
state = [e, ...state];
}


// Option: obtenir un endroit par id
Endroit? getById(String id) => state.firstWhere((e) => e.id == id, orElse: () => null);
}


// Provider global  @Dr_Love
final endroitsProvider = StateNotifierProvider<EndroitsUtilisateur, List<Endroit>>(
(ref) => EndroitsUtilisateur(),
);