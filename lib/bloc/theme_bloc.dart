import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Cubit<bool> {
  ThemeBloc({isLight = false}) : super(isLight);

  void changeTheme() => emit(!state);
}