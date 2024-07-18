import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';
import 'package:learn_bloc/bloc/theme_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              context.read<ThemeBloc>().changeTheme();
            },
            child: state
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          );
        },
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CounterBloc, int>(
            listener: (context, state) =>
                ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 200),
                content: Text("ALERT!!! Counter do atas 15"),
              ),
            ),
            listenWhen: (previous, current) => current > 15 ? true : false,
          ),
          BlocListener<ThemeBloc, bool>(
            listener: (context, state) =>
                ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(milliseconds: 200),
                content: Text("TEMA GELAP AKTIF"),
              ),
            ),
            listenWhen: (previous, current) => !current,
          ),
        ],
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().decrement();
                },
                child: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 20,
              ),
              BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: const TextStyle(fontSize: 50),
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().increment();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
