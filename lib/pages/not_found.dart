import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("404"),),
      body: const Center(
        child: Text(
          "Page not Found",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
