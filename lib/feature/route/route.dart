import 'package:app_1/feature/todo/edit_todo_screen.dart';

import '../todo/add_todo.dart';
import '../todo/add_todo_screen.dart';
import '../todo/todo_screen.dart';

import 'route_constant.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? customRouteGenerator(RouteSettings settings) {
    switch (settings.name) {
      case todoScreen:
        return MaterialPageRoute(
            settings: RouteSettings(arguments: settings.arguments),
            builder: (_) => TodoScreen());
      case addTodo:
        return MaterialPageRoute(builder: (_) => AddTodo());
      case editTodo:
        final argument = settings.arguments as dynamic;
        return MaterialPageRoute(
            settings: RouteSettings(arguments: settings.arguments),
            builder: (_) => EditTodo(todo: argument));
    }
  }
}
