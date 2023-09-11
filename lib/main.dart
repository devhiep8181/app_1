import 'package:app_1/feature/home/select_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'feature/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      // ChangeNotifierProvider(
      //       create: (context) => TodoProvider(), child: AppFirst())
      const MaterialApp(
    home: SelectScreen(),
  ));
}

class AppFirst extends StatelessWidget {
  const AppFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Rubik"),
      onGenerateRoute: Routes.customRouteGenerator,
      debugShowCheckedModeBanner: false,
    );
  }
}
