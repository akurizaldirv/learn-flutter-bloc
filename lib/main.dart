import 'package:flutter/material.dart';
import 'package:learn_bloc/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      onGenerateRoute: appRoute.onRoute,
    );
  }
}

