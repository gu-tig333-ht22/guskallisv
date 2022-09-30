import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/model.dart';
import 'MainView.dart';

void main() {
  var state = MyState();
  state.getTodo();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        splashColor: Color.fromARGB(179, 0, 2, 5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainView(),
    );
  }
}
