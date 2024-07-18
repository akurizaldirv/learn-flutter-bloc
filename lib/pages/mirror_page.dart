import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';

class MirrorPage extends StatelessWidget {
  const MirrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mirror Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/NO_PAGES_WITH_THIS_ROUTE");
        },
        child: const Icon(Icons.error),
      ),
      body: Center(
          child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) => Text(
          "$state",
          style: const TextStyle(fontSize: 50),
        ),
      )),
    );
  }
}
