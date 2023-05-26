import 'package:hive_flutter/adapters.dart';
import 'package:note_app_bloc/model/note_model.dart';

class NoteDataBase {
  //box name
  final String _boxName = 'noteBox';
  //open box
  Future<Box> noteBox() async {
    var box = await Hive.openBox<NoteModel>(_boxName);
    return box;
  }

  //get all notes
  Future<List<NoteModel>> getAllNotes() async {
    var box = await Hive.openBox<NoteModel>(_boxName);
    // var box = await noteBox();
    //to cast the box values into NoteModel we use cast function
    List<NoteModel> noteList = box.values.toList().cast<NoteModel>();
    return noteList;
  }

  //add notes
  Future<void> addNote(NoteModel noteModel) async {
    var box = await Hive.openBox<NoteModel>(_boxName);
    await box.add(noteModel);
  }

  //delete note
  Future<void> deleteNote(int index) async {
    var box = await Hive.openBox<NoteModel>(_boxName);
    await box.deleteAt(index);
  }

  //delete all note
  Future<void> deleteAllNote(int index) async {
    var box = await Hive.openBox<NoteModel>(_boxName);
    box.clear();
  }

  //update note
  Future<void> updateNote(
      {required int index, required NoteModel noteModel}) async {
    var box = await Hive.openBox<NoteModel>(_boxName);
    await box.put(index, noteModel);
  }
}
