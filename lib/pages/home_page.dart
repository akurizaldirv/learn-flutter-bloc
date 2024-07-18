import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit userBloc = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: BlocSelector<UserCubit, Map<String, dynamic>, String>(
          selector: (state) => state['name'],
          builder: (context, state) => Text(state),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              BlocSelector<UserCubit, Map<String, dynamic>, int>(
                selector: (state) => state['age'],
                builder: (context, state) => Text(
                  "$state",
                  style: const TextStyle(fontSize: 50),
                ),
              ),
              TextField(
                onChanged: (value) => userBloc.changeName(value),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        userBloc.decrementAge();
                      },
                      icon: const Icon(Icons.remove)),
                  IconButton(
                      onPressed: () {
                        userBloc.incrementAge();
                      },
                      icon: const Icon(Icons.add)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
