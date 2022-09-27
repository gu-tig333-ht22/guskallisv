import 'package:flutter/material.dart';
import './model.dart';

class AddTodoView extends StatefulWidget {
  final newTodo message;
  const AddTodoView(this.message);

  @override
  State<StatefulWidget> createState() {
    return AddTodoViewState(message);
  }
}

class AddTodoViewState extends State<AddTodoView> {
  String message = "message";
  TextEditingController textEditingController = TextEditingController();

  AddTodoViewState(newTodo todo) {
    this.message = todo.message;

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lägg till To-Do'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(height: 40),
              _todoInputField(),
              Container(height: 20),
              _addButton(),
            ])));
  }

  Widget _todoInputField() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(16),
          hintText: 'Vad ska du göra?',
        ),
      ),
    );
  }

  Widget _addButton() {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context, newTodo(message: message, id: ""));
          },
          icon: Icon(
            Icons.add,
            color: Colors.black,
            size: 20.0,
          ),
          label: Text("Lägg till",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              )),
        ),
      ],
    );
  }
}
