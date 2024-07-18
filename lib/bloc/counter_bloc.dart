import 'package:bloc/bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc({initialData = 0}) : super(initialData);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }
}

