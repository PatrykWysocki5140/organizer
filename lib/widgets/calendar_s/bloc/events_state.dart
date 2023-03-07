part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class EventsInitial extends EventsState {}

class EventsLoaded extends EventsState {
  final List<Event> events;

  EventsLoaded({required this.events});
}
