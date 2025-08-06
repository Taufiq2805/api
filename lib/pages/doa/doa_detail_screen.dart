import 'package:flutter/material.dart';

class DoaDetailScreen extends StatelessWidget {
  final String id;
  final String doa;
  final String ayat;
  final String latin;
  final String artinya;

  DoaDetailScreen({
    required this.id,
    required this.doa, 
    required this.ayat, 
    required this.latin, 
    required this.artinya,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(id!, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(doa!, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Text(ayat!, style: const TextStyle(fontSize: 16)),
               const SizedBox(height: 20),
              Text(latin!, style: const TextStyle(fontSize: 16)),
               const SizedBox(height: 20),
              Text(artinya!, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
