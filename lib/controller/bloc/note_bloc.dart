import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:note_app_bloc/controller/note_database.dart';
import 'package:note_app_bloc/model/note_model.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final NoteDataBase _noteDataBase = NoteDataBase();

  List<NoteModel> notes = [];

  NoteBloc() : super(NoteInitial()) {
    // initial event
    on<NoteLoadEvent>((event, emit) async {
      // await Future<void>.delayed(const Duration(seconds: 1));
      emit(NoteLoad(noteModels: notes));
      notes = await _noteDataBase.getAllNotes();
      emit(YourNoteState(noteModels: notes));
    });

    on<NoteAddEvent>((event, emit) {
      NoteModel noteModel = NoteModel(id: event.id, contents: event.contents);
      _noteDataBase.addNote(noteModel);
      add(NoteLoadEvent());
    });

    on<NoteUpdateEvent>((event, emit) {
      NoteModel noteModel = NoteModel(id: event.id, contents: event.contents);
      _noteDataBase.updateNote(noteModel: noteModel);
      add(NoteLoadEvent());
    });
  }
}
