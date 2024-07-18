import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<Map<String, dynamic>> {
  UserCubit() : super({"name": "Default Name", "age": 0});

  void changeName(String newName) {
    emit({
      "name": newName,
      "age": state["age"],
    });
  }

  void changeAge(int newAge) {
    emit({
      "name": state["name"],
      "age": newAge,
    });
  }

  void incrementAge() {
    emit({
      "name": state["name"],
      "age": state["age"] + 1,
    });
  }

  void decrementAge() {
    emit({
      "name": state["name"],
      "age": state["age"] - 1,
    });
  }
}
