import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String contents;
  NoteModel({required this.id, required this.contents});
}
