import 'dart:convert';

import 'package:app_1/feature/todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;
  void setTodos(List<TodoModel> newTodos) {
    _todos = newTodos;
    notifyListeners();
  }

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    final index = _todos.indexWhere((element) => element.uid == todo.uid);
    if (index != -1) {
      _todos[index] = todo;
    }
    notifyListeners();
  }

  void deleteTodo(String uid) {
    _todos.removeWhere((element) => element.uid == uid);
    notifyListeners();
  }

  bool isTodoDone(TodoModel todo) {
    return todo.isDone == 'true'; // Chuyển đổi từ chuỗi sang bool
  }

  void updateTodoStatus(TodoModel todo, bool isDone) {
    todo.isDone = isDone ? "true" : "false";
    notifyListeners(); // Thông báo cho các widget nghe lắng nghe Provider rằng dữ liệu đã thay đổi
    // Cập nhật vào SharedPreferences ở đây
    setData(todos);
  }

  setData(List<TodoModel> todo) async {
    final List<Map<String, dynamic>> listTodoMap =
        todo.map((e) => e.toMap()).toList();
    String json = jsonEncode(listTodoMap);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("isSave", json);
  }
}
