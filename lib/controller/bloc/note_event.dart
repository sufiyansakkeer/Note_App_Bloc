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
  final String id, contents;

  const NoteAddEvent({required this.id, required this.contents});
}

// update event
class NoteUpdateEvent extends NoteEvent {
  final String id, contents;

  const NoteUpdateEvent({required this.id, required this.contents});
}

//delete event
class NoteDeleteEvent extends NoteEvent {
  final int index;

  const NoteDeleteEvent({required this.index});
}
