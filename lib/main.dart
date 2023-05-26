import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:note_app_bloc/controller/bloc/note_bloc.dart';

import 'package:note_app_bloc/view/home_page.dart';

import 'model/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  // await Hive.openBox("noteBox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(),
      child: MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        home: const RootPage(),
      ),
    );
  }
}
