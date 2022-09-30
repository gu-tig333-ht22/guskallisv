import 'package:flutter/material.dart';
import './model.dart';
import 'package:google_fonts/google_fonts.dart';

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
          title: Text(
            'Lägg till To-Do',
            style: GoogleFonts.oswald(
              fontSize: 30,
            ),
          ),
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
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        textAlign: TextAlign.center,
        controller: textEditingController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(18),
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
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 26.0,
          ),
          label: Text(
            "LÄGG TILL",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
