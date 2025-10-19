final void Function(File image) onPhotoSelectionne;


const ImagePrise({super.key, required this.onPhotoSelectionne});


@override
State<ImagePrise> createState() => _ImagePriseState();
}


class _ImagePriseState extends State<ImagePrise> {
File? _photoSelectionne;
final ImagePicker _picker = ImagePicker();


Future<void> _prendrePhoto() async {
try {
final XFile? photoPrise = await _picker.pickImage(
source: ImageSource.camera,
maxWidth: 800,
imageQuality: 80,
);


if (photoPrise == null) return; // utilisateur a annulé


final file = File(photoPrise.path);


setState(() {
_photoSelectionne = file;
});


// appelle le callback
widget.onPhotoSelectionne(file);
} catch (e) {
// erreur simple — afficher snackbar
if (context.mounted) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Erreur lors de la prise de photo : $e')),
);
}
}
}


@override
Widget build(BuildContext context) {
return _photoSelectionne == null
? TextButton.icon(
onPressed: _prendrePhoto,
icon: Icon(Icons.camera_alt),
label: Text('Prendre photo'),
)
: GestureDetector(
onTap: _prendrePhoto,
child: ClipRRect(
borderRadius: BorderRadius.circular(8),
child: Image.file(
_photoSelectionne!,
width: 150,
height: 150,
fit: BoxFit.cover,
),
),
);
}
}