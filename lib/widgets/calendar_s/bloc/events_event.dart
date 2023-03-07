part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class AddEvent extends EventsEvent {
  final Event event;

  AddEvent({required this.event});
}

class LoadEvents extends EventsEvent {}
