part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

//initial state
class NoteInitial extends NoteState {}

//load state
class NoteLoad extends NoteState {
  final List<NoteModel> noteModels;

  const NoteLoad({required this.noteModels});
}

//edit notes
class EditNoteState extends NoteState {
  final NoteModel noteModel;

  const EditNoteState({required this.noteModel});
}

//your notes
class YourNoteState extends NoteState {
  final List<NoteModel> noteModels;

  const YourNoteState({required this.noteModels});
}

//new notes
class NewNoteState extends NoteState {}
