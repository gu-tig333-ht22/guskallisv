import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mainview(),
    );
  }
}

class Mainview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: _list(),
    );
  }

  Widget _list() {
    var todos = [
      "Handla",
      "Städa",
      "Träna",
      "Laga mat",
      "Plugga",
      "Jobba",
      "AW",
      "Titta på TV",
    ];

    var list = List.generate(todos.length, (index) => "${todos[index]}");

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 55,
      ),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            _item(list[index]),
            const Divider(height: 20, thickness: 3),
          ],
        );
      },
    );
  }

  Widget _item(text) {
    return ListTile(
      leading: Checkbox(
        value: false,
        onChanged: (val) {},
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 25),
      ),
      trailing: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
      ),
    );
  }
}
