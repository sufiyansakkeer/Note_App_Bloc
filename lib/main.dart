import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app_bloc/screens/root_page.dart';
import 'dart:math' as math show Random;

void main() {
  runApp(const MyApp());
}

const names = [
  'Foo',
  'Bar',
  'Baz',
];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

// allow picking random names in the cubit
class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);
  void pickRandomName() => emit(names.getRandomElement());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: const RootPage(),
    );
  }
}
