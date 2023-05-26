part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

//initial event

class NoteLoadEvent extends NoteEvent {}

// add event
class NoteAddEvent extends NoteEvent {
  final String title, contents;

  const NoteAddEvent({required this.title, required this.contents});
}

// update event
class NoteUpdateEvent extends NoteEvent {
  final String title, contents;
  final int index;

  const NoteUpdateEvent(
      {required this.title, required this.contents, required this.index});
}

//delete event
class NoteDeleteEvent extends NoteEvent {
  final int index;

  const NoteDeleteEvent({required this.index});
}
