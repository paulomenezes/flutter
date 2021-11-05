import 'package:flutter/material.dart';
import './utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> listItems = [];

  void toggle(int index) {
    setState(() {
      listItems[index].isChecked = !listItems[index].isChecked;
    });
  }

  void uncheckAll() {
    setState(() {
      for (var i = 0; i < listItems.length; i++) {
        listItems[i].isChecked = false;
      }
    });
  }

  _HomePageState() {
    for (var i = 0; i < 1000; i++) {
      listItems.add(Item(i, Utils.generateRandomString(10),
          Utils.generateRandomEnabledState()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge"),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              uncheckAll();
            },
            child: const Text("Resetar todos os itens")),
        Expanded(
            child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
              color: listItems[index].isChecked == true
                  ? Colors.blue
                  : Colors.white,
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Row(
                children: [
                  Text(listItems[index].title),
                  const Spacer(),
                  Checkbox(
                      value: listItems[index].isChecked,
                      onChanged: (checked) {
                        toggle(index);
                      })
                ],
              )),
          itemCount: listItems.length,
        ))
      ]),
    );
  }
}

class Item {
  int id;
  String title;
  bool isChecked;

  Item(this.id, this.title, this.isChecked);
}
