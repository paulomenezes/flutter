import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Start',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercicio 8"),
        ),
        body: ContentWidget(),
      )));
}

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentState();
}

class _ContentState extends State<ContentWidget> {
  String texto = "Inicio";

  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(texto),
      TextField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(), hintText: "Digite algo"),
        controller: inputController,
      ),
      ElevatedButton(
          onPressed: () {
            setState(() {
              texto = inputController.text;
            });
          },
          child: const Text("Clique aqui"))
    ]);
  }
}
