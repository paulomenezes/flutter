import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Start',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercicio 8"),
        ),
        body: Column(children: const [
          Text("Item 1"),
          Divider(),
          Text("Item 2"),
          Divider(),
          Text("Item 3"),
          Divider(),
          Text("Item 4"),
          Divider(),
          Text("Item 5"),
        ]),
      )));
}
