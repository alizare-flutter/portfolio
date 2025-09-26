import 'package:flutter/material.dart';
import 'views/screens/about_me_screen.dart';
import 'views/screens/project_screen.dart';
import 'views/screens/skills_screen.dart';
import 'views/screens/home_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '#about_me': (context) => AboutMeScreen(),
        '#my_skill': (context) => SkillsScreen(),
        '#my_projects': (context) => ProjectScreen()
      },
    );
  }
}