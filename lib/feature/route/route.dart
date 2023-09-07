import 'package:app_1/feature/login/login_screen.dart';
import 'package:app_1/feature/login/sign_up_screen.dart';
import 'package:app_1/feature/onboarding/onboarding_screen.dart';
import 'package:app_1/feature/splash/splash_screen.dart';
import 'package:app_1/feature/todo/edit_todo_screen.dart';

import '../todo/add_todo.dart';
import '../todo/add_todo_screen.dart';
import '../todo/todo_screen.dart';

import 'route_constant.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic>? customRouteGenerator(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case onboarding:
        return MaterialPageRoute(builder: (_) => Onboarding());
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
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUp());
    }
  }
}
