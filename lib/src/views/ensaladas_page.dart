import 'package:apprecetas/src/api/api.dart';
import 'package:apprecetas/widgets/item_list.dart';
import 'package:flutter/material.dart';

class EnsaladasPage extends StatelessWidget {
  const EnsaladasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 230, 207),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 230, 207),
        title: Text(
          "Ensaladas",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: const Color.fromARGB(255, 97, 62, 49)),
        ),
      ),
      body: ListView.builder(
        itemCount: ensaladas.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemList(
            receta: ensaladas[index],
          );
        },
      ),
    );
  }
}
