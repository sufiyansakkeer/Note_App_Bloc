import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app_bloc/controller/bloc/note_bloc.dart';
import 'package:note_app_bloc/model/note_model.dart';

class EditNote extends StatefulWidget {
  EditNote({
    super.key,
    required this.noteModel,
    required this.index,
  });

  final NoteModel noteModel;
  final int index;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    _textEditingController.text = widget.noteModel.contents.toString();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            FilledButton(
              onPressed: () {
                BlocProvider.of<NoteBloc>(context).add(NoteUpdateEvent(
                    title: widget.noteModel.title,
                    contents: widget.noteModel.contents,
                    index: widget.index));
                Navigator.pop(context);
              },
              child: Text("update"),
            ),
          ],
        ),
      ),
    );
  }
}
