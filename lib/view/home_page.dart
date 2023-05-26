import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_bloc/controller/bloc/note_bloc.dart';
import 'package:note_app_bloc/view/edit_screen.dart';
import 'package:note_app_bloc/view/widgets/custom_floating_button.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    //
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("HomeScreen"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          log(state.toString());
          if (state is NoteInitial) {
            context.read<NoteBloc>().add(NoteLoadEvent());
          }
          if (state is YourNoteState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                log(state.noteModels.length.toString());
                return ListTile(
                  title: Text(state.noteModels[index].contents),
                  onLongPress: () =>
                      Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditNote(
                        noteModel: state.noteModels[index], index: index),
                  )),
                );
              },
              itemCount: state.noteModels.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton:
          CustomFloatingButton(formKey: _formKey, controller: controller),
    );
  }
}
