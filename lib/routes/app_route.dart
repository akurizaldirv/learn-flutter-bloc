import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter_bloc.dart';
import 'package:learn_bloc/pages/home_page.dart';
import 'package:learn_bloc/pages/mirror_page.dart';
import 'package:learn_bloc/pages/not_found.dart';

class AppRoute {
  CounterBloc appCouter = CounterBloc(initialData: 7);

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        {
          return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
            value: appCouter,
            child: const HomePage(),
          ));
        }
      case "/mirror":
        {
          return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
            value: appCouter,
            child: const MirrorPage(),
          ));
        }
      default:
        {
          return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
            value: appCouter,
            child: const NotFound(),
          ));
        }
    }
  }
}
