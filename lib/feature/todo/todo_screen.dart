import 'dart:convert';
import '../route/route_constant.dart';
import 'todo_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/color_palettes.dart';
import '../theme/typhography.dart';
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
        backgroundColor: ColorPalettes.primaryColor,
        title: Text("Todo List", style: AppTextStyle.H4(color: Colors.white)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorPalettes.primaryColor,
        onPressed: () {
          Navigator.of(context).pushNamed(addTodo);
        },
        child: const Icon(Icons.add),
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
                          padding: const EdgeInsets.all(8),
                          width: double.minPositive,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 0.5,
                              color: const Color(0xffBEBAB3),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2), // Màu của đổ bóng
                                spreadRadius: 2, // Bán kính của đổ bóng
                                blurRadius: 4, // Độ mờ của đổ bóng
                                offset:
                                    const Offset(0, 2), // Vị trí của đổ bóng
                              ),
                            ],
                          ),
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
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
                                      icon: const Icon(Icons.delete))
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
