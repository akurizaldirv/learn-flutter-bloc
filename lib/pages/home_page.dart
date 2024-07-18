import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLoC Cubit",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade500,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/mirror"),
        child: const Icon(Icons.pages),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, int>(
            builder: (context, state) {
              return Center(
                child: Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                ),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Lebih dari 15 : $state"),
                duration: const Duration(milliseconds: 300),
              ));
            },
            buildWhen: (previous, current) => current <= 15,
            listenWhen: (previous, current) => current > 15,
          ),
          // BlocListener<CounterBloc, int>(
          //   listener: (context, state) {
          //     ScaffoldMessenger.of(context)
          //         .showSnackBar(SnackBar(content: Text("Lebih dari 15 : $state")));
          //   },
          //   listenWhen: (previous, current) {
          //     if (current > 15) {
          //       return true;
          //     } else {
          //       return false;
          //     }
          //   },
          //   child: BlocBuilder<CounterBloc, int>(
          //     builder: (context, state) {
          //       return Center(
          //         child: Text(
          //           "$state",
          //           style: const TextStyle(fontSize: 50),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  context.read<CounterBloc>().increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
