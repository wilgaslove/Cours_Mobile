// vue/endroit_detail.dart
import 'package:flutter/material.dart';
import '../modele/endroit.dart';


class EndroitDetail extends StatelessWidget {
final Endroit endroit;


const EndroitDetail({super.key, required this.endroit});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(endroit.nom)),
body: Center(
child: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
if (endroit.image != null)
ClipRRect(
borderRadius: BorderRadius.circular(12),
child: Image.file(
endroit.image!,
width: 300,
height: 300,
fit: BoxFit.cover,
),
)
else
const Icon(Icons.place, size: 120),


const SizedBox(height: 16),
Text(endroit.nom, style: Theme.of(context).textTheme.headlineSmall),
const SizedBox(height: 8),
Text('ID: ${endroit.id}'),
],
),
),
),
);
}
}