import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'todo_model.dart';
import 'todo_provider.dart';

class EditTodo extends StatefulWidget {
  final TodoModel todo;
  const EditTodo({super.key, required this.todo});

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var uid = const Uuid();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedStartTime =
        await showTimePicker(context: context, initialTime: startTime);
    if (pickedStartTime != null && pickedStartTime != startTime) {
      setState(() {
        startTime = pickedStartTime;
      });
    }
  }

  selectEndTime(BuildContext context) async {
    final TimeOfDay? pickedEndTime =
        await showTimePicker(context: context, initialTime: endTime);
    if (pickedEndTime != null && pickedEndTime != endTime) {
      setState(() {
        endTime = pickedEndTime;
      });
    }
  }

  void initState() {
    super.initState();
    titleController.text = widget.todo.title;
    descriptionController.text = widget.todo.description;
  }

  setData(List<TodoModel> todo) async {
    final List<Map<String, dynamic>> listTodoMap =
        todo.map((e) => e.toMap()).toList();
    String json = jsonEncode(listTodoMap);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isSave", json);
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Todo"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(hintText: widget.todo.title),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter description",
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        selectStartTime(context);
                      },
                      child: Text(
                        "Start Time: ${startTime.format(context)}",
                        style: TextStyle(color: Color(0xFF65AAEA)),
                      )),
                  TextButton(
                      onPressed: () {
                        selectEndTime(context);
                      },
                      child: Text(
                        "End Time: ${endTime.format(context)}",
                        style: TextStyle(color: Colors.red),
                      )),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    TodoModel todo = TodoModel(
                        uid: widget.todo.uid, // trùng id mới update được
                        title: titleController.text,
                        description: descriptionController.text,
                        startTime: startTime.toString(),
                        endTime: endTime.toString(),
                        isDone: "false");
                    todoProvider.updateTodo(todo);
                    setData(todoProvider.todos);
                    Navigator.of(context).pop();
                  },
                  child: Text("Save")),
            ],
          ),
        ));
  }
}
