import 'package:flutter/material.dart';
import '../modele/endroit.dart';
import '../vue/endroit_detail.dart';


class EndroitsList extends StatelessWidget {
final List<Endroit> endroits;


const EndroitsList({super.key, required this.endroits});


@override
Widget build(BuildContext context) {
if (endroits.isEmpty) {
return Center(
child: Text(
'Aucun endroit favori pour le moment. Appuie sur + pour en ajouter.',
textAlign: TextAlign.center,
),
);
}


return ListView.builder(
itemCount: endroits.length,
itemBuilder: (context, index) {
final e = endroits[index];
return ListTile(
leading: e.image != null
? ClipRRect(
borderRadius: BorderRadius.circular(8),
child: Image.file(
e.image!,
width: 56,
height: 56,
fit: BoxFit.cover,
),
)
: CircleAvatar(child: Icon(Icons.place)),
title: Text(e.nom),
subtitle: Text('ID: ${e.id.substring(0, 6)}...'),
onTap: () {
Navigator.of(context).push(MaterialPageRoute(
builder: (_) => EndroitDetail(endroit: e),
));
},
);
},
);
}
}