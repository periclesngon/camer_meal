import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Camer Meal",
          style: TextStyle(
              color: Colors.red.shade100,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(),
    );
  }
}
