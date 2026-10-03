import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicing_bloc_example2/bloc/switch_bloc/switch_bloc.dart';
import 'package:practicing_bloc_example2/screen/slider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SwitchBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SwitchWidget(),
      ),
    );
  }
}
