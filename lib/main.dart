import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo App',
      home: new App(),
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  List<String> todos = [];

  void addTodo() {
    setState(() {
      int index = todos.length;
      todos.add('Todo ' + index.toString());
    });
    print(todos);
  }

  Widget todoList() {
   return new ListView.builder(itemBuilder: (context, index) {
     if(index < todos.length) {
       return todoItem(todos[index]);
     }
   });
  }

  Widget todoItem(String todoName) {
    return Card(
      child: new ListTile(
        title: Text(todoName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: Text('Good Morning!')),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: todoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
