import 'dart:convert';

import 'package:app_1/feature/todo/todo_model.dart';
import 'package:app_1/feature/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

import '../theme/color_palettes.dart';
import '../theme/typhography.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
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
    //final todos = todoProvider.todos; // Danh sách công việc

    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalettes.primaryColor,
          title: Text("Add Todo", style: AppTextStyle.H4(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter title",
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter description",
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        selectStartTime(context);
                      },
                      child: Text(
                        "Start Time: ${startTime.format(context)}",
                        style: const TextStyle(color: Color(0xFF65AAEA)),
                      )),
                  TextButton(
                      onPressed: () {
                        selectEndTime(context);
                      },
                      child: Text(
                        "End Time: ${endTime.format(context)}",
                        style: const TextStyle(color: Colors.red),
                      )),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPalettes.primaryColor,
                  ),
                  onPressed: () {
                    TodoModel todo = TodoModel(
                        uid: uid.v4(),
                        title: titleController.text,
                        description: descriptionController.text,
                        startTime: startTime.toString(),
                        endTime: endTime.toString(),
                        isDone: "false");
                    todoProvider.addTodo(todo);

                    Navigator.of(context).pop();
                    setData(todoProvider.todos);
                  },
                  child: Text("Save",
                      style: AppTextStyle.buttonMedium(color: Colors.white))),
            ],
          ),
        ));
  }
}
