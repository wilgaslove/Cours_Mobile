import 'package:flutter/material.dart';

void main() {
  runApp(MonAppli());
}

class MonAppli extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine',
      debugShowCheckedModeBanner: false,
      home: PageAccueil(),
    );
  }
}

class PageAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Magazine Infos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            //  menu
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              //  recherche
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/images/magazineInfo.jpg', // 🔹 Image  magazine
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange, 
        onPressed: () {
          print('Tu as cliqué dessus'); // Vérification dans ma console
        },
        child: const Text(
          'Click',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
