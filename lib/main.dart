import 'package:flutter/material.dart';
import 'package:todo/screens/todo_list.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: TodoList(),
    );
  }
}

