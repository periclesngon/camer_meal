import 'package:camer_meals/pages/login_page.dart';
import 'package:camer_meals/pages/signup_page.dart';
import 'package:camer_meals/widget/button_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/next': (context) => const HomeScreen (),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// Your LoginPage and other related classes go here...
