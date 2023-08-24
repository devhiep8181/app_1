import 'package:app_1/test.dart';

import 'feature/todo/add_todo.dart';
import 'feature/route/route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //onGenerateRoute: Routes.customRouteGenerator,
        home: AddToDo());
  }
}
