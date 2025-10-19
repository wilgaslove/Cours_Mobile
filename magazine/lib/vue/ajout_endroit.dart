
class AjoutEndroit extends ConsumerStatefulWidget {
const AjoutEndroit({super.key});


@override
ConsumerState<AjoutEndroit> createState() => _AjoutEndroitState();
}


class _AjoutEndroitState extends ConsumerState<AjoutEndroit> {
final TextEditingController _nomController = TextEditingController();
File? _image;


void _onPhoto(File image) {
setState(() {
_image = image;
});
}


void _enregistreEndroit() {
final nomSaisi = _nomController.text.trim();
if (nomSaisi.isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Le nom de l\'endroit est requis.')),
);
return;
}


// Appel du provider pour ajouter
ref.read(endroitsProvider.notifier).ajoutEndroit(nomSaisi, image: _image);


Navigator.of(context).pop();
}


@override
void dispose() {
_nomController.dispose();
super.dispose();
}


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text("Ajout d'un nouveau endroit")),
body: SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.all(16),
child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
TextField(
controller: _nomController,
decoration: const InputDecoration(
labelText: 'Nom de l\'endroit',
border: OutlineInputBorder(),
),
),
const SizedBox(height: 16),


// Widget image_prise
ImagePrise(onPhotoSelectionne: _onPhoto),


const SizedBox(height: 24),


ElevatedButton.icon(
onPressed: _enregistreEndroit,
icon: const Icon(Icons.add_location_alt),
label: const Text('Ajouter cet endroit'),
),
],
),
),
),
);
}
}