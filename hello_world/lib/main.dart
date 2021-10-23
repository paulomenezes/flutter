import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Flutter Start',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello World"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(children: [
                  Container(
                      child: const Text(
                        "Texto 1",
                        style: TextStyle(backgroundColor: Colors.blue),
                      ),
                      padding: const EdgeInsets.all(10)),
                  Container(
                      child: const Text(
                        "Texto 2",
                        style: TextStyle(backgroundColor: Colors.blue),
                      ),
                      padding: const EdgeInsets.all(10)),
                ]),
                Row(children: [
                  Container(
                      child: const Text(
                        "Texto 3",
                        style: TextStyle(backgroundColor: Colors.blue),
                      ),
                      padding: const EdgeInsets.all(10)),
                  Container(
                      child: const Text(
                        "Texto 4",
                        style: TextStyle(backgroundColor: Colors.blue),
                      ),
                      padding: const EdgeInsets.all(10)),
                ]),
              ],
            )),
      )));
}
