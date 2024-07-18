import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc({init = 0}) : super(init);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
