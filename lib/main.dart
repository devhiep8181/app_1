import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/route/route.dart';
import 'feature/todo/todo_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(
      create: (context) => TodoProvider(), child: AppFirst()));
}

class AppFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Rubik"),
      onGenerateRoute: Routes.customRouteGenerator,
      debugShowCheckedModeBanner: false,
    );
  }
}
