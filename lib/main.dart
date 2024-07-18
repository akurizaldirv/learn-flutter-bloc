import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_bloc/bloc/user_cubit.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:learn_bloc/pages/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
