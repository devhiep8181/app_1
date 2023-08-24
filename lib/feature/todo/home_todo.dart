import '../route/route_constant.dart';
import 'content.dart';
import 'package:flutter/material.dart';

class HomeToDo extends StatefulWidget {
  //ContentToDo todo;
  HomeToDo({super.key});

  @override
  State<HomeToDo> createState() => _HomeToDoState();
}

class _HomeToDoState extends State<HomeToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To Do"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(addToDo);
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [Center(child: Text("Hihi"))],
        ));
  }
}
