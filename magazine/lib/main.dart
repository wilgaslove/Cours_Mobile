
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'vue/ajout_endroit.dart';
import 'providers/endroits_utilisateurs.dart';
import 'widgets/endroits_list.dart';


void main() {
runApp(const ProviderScope(child: MonApplication()));
}


class MonApplication extends StatelessWidget {
const MonApplication({super.key});

