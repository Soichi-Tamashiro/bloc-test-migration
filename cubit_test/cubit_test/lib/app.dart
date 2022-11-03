import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc cubit test',
      home: BlocProvider(create: (context) => TodoCubit(TodoRepositoryImpl())),
      child: const TodoName(),
    );
  }
}
