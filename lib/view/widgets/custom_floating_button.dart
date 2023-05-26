import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_bloc/controller/bloc/note_bloc.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      onPressed: () {
        showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: controller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    FilledButton(
                      child: const Text('Add note'),
                      onPressed: () {
                        BlocProvider.of<NoteBloc>(context).add(NoteAddEvent(
                            id: DateTime.now()
                                .microsecondsSinceEpoch
                                .toString(),
                            contents: controller.text));
                        // NoteModel(title: "new", contents: controller.text);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            });
      },
      icon: Icon(
        Icons.add,
      ),
    );
  }
}
