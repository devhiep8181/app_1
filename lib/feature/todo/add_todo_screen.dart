import 'dart:convert';

import 'package:app_1/feature/todo/todo_model.dart';
import 'package:app_1/feature/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

//TODO: 25/8 XONG MÀM ADD
// DỰ kiến cập nhập chuyển dữ liệu sang màn hình home và tính năng sửa xoá vào ngày 27.8

class AddTodo extends StatefulWidget {
  AddTodo({super.key});

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
          title: Text("Add Todo"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "Enter title",
                ),
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
                  child: Text("Save")),
            ],
          ),
        ));
  }
}
