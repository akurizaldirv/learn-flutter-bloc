import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/theme_bloc.dart';
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
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, state) => MaterialApp(
            theme: state ? ThemeData.light() : ThemeData.dark(),
            home: const HomePage(),
          ),
        ));
  }
}
