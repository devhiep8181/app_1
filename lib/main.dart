import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/route/route.dart';
import 'feature/todo/todo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: AppFirst()));
}

class AppFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.customRouteGenerator,
      debugShowCheckedModeBanner: false,
    );
  }
}
