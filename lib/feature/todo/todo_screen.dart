import 'dart:convert';
import 'package:app_1/feature/route/route_constant.dart';
import 'package:app_1/feature/todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'todo_provider.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  late TodoProvider todoProvider;
  List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Thực hiện việc truy cập Provider trong phương thức didChangeDependencies.
    todoProvider = Provider.of<TodoProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    todos = todoProvider.todos;
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(addTodo);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_, index) {
                    final todo = todos[index];
                    final textDecoration = todo.isDone == 'true'
                        ? TextDecoration.lineThrough
                        : TextDecoration.none;
                    return InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(editTodo, arguments: todo);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: double.minPositive,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 227, 224, 225),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xffBEBAB3),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    todo.title,
                                    style: TextStyle(
                                        decoration: textDecoration,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    todo.description,
                                    style: TextStyle(
                                        decoration: textDecoration,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${todo.startTime.toString().substring(10, 15)} - ${todo.endTime.toString().substring(10, 15)}',
                                    style: TextStyle(
                                        decoration: textDecoration,
                                        fontSize: 16,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 32,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: todoProvider.isTodoDone(todo),
                                      onChanged: (value) {
                                        todoProvider.updateTodoStatus(
                                            todo, value!);
                                      }),
                                  IconButton(
                                      onPressed: () {
                                        todoProvider.deleteTodo(todo.uid);
                                        setData(todoProvider.todos);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }

  setData(List<TodoModel> todo) async {
    final List<Map<String, dynamic>> listTodoMap =
        todo.map((e) => e.toMap()).toList();
    String json = jsonEncode(listTodoMap);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isSave", json);
  }

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString("isSave");
    final List<dynamic> listTodoMap = jsonDecode(data ?? "");
    final List<TodoModel> listTodoModel =
        listTodoMap.map((e) => TodoModel.fromMap(e)).toList();
    todoProvider.setTodos(listTodoModel);
  }
}
