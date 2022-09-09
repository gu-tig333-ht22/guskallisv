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
        title: const Text("To-Do App"),
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondView()));
        },
      ),
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
    ];

    var list = List.generate(todos.length, (index) => "${todos[index]}");

    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: kFloatingActionButtonMargin + 45,
      ),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            _item(list[index]),
            const Divider(height: 10, thickness: 1),
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
        style: TextStyle(fontSize: 20),
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
        title: const Text("To-Do App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 10),
            _todoLabel(),
            Container(height: 10),
            _todoInputField(),
            Container(height: 20),
            _iconAddRow(),
          ],
        ),
      ),
    );
  }

  Widget _todoLabel() {
    return Container(
      margin: EdgeInsets.only(top: 22),
      child: Text(
        "Ny To-Do",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _todoInputField() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Vad ska du göra?",
        ),
      ),
    );
  }

  Widget _iconAddRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Icon(Icons.add),
        ),
        Column(
          children: [
            Text("Lägg till", style: TextStyle(fontSize: 17)),
          ],
        ),
      ],
    );
  }
}
