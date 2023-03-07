import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:organizer/models/event.dart';

part 'events_event.dart';
part 'events_state.dart';

/*
class CalendarSBloc extends Bloc<CalendarSEvent, CalendarSState> {
  CalendarSBloc() : super(CalendarSInitial()) {
    on<CalendarSEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState.initialState()) {
    on<SelectDateEvent>((event, emit) {
      emit(state.copyWith(selectedDate: event.selectedDate));
    });
    on<AddEventEvent>((event, emit) {
      final updatedEvents = Map<DateTime, List<String>>.from(state.events);
      if (updatedEvents[event.date] != null) {
        updatedEvents[event.date]!.add(event.eventName);
      } else {
        updatedEvents[event.date] = [event.eventName];
      }
      emit(state.copyWith(events: updatedEvents));
    });
    on<RefreshCalendarEvent>((event, emit) {
      emit(state.copyWith());
    });
    on((event, emit) => null);
  }
*/ /*
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  List<Event> events = [];

  EventsBloc() : super(EventsInitial()) {
    on<AddEvent>((event, emit) {events.add(event.event);
      emit(state.copyWith(selectedDate: event.selectedDate));
    });
    on<LoadEvents>((event, emit) {
      final updatedEvents = Map<DateTime, List<String>>.from(state.events);
      if (updatedEvents[event.date] != null) {
        updatedEvents[event.date]!.add(event.eventName);
      } else {
        updatedEvents[event.date] = [event.eventName];
      }
      emit(state.copyWith(events: updatedEvents));
    });
    on<RefreshCalendarEvent>((event, emit) {
      emit(state.copyWith());
    });
    on((event, emit) => null);
  }}*/

/*
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial());

  List<Event> events = [];

  @override
  Stream<EventsState> mapEventToState(
    EventsEvent event,
  ) async* {
    if (event is AddEvent) {
      events.add(event.event);
      yield EventsLoaded(events: events);
    } else if (event is LoadEvents) {
      yield EventsLoaded(events: events);
    }
  }
}*/

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  List<Event> _events = [];

  EventsBloc() : super(EventsInitial()) {
    on<AddEvent>((event, emit) {
      _events.add(event.event);
      //_saveEvents();
      emit(EventsLoaded(events: _events));
    });
  }

  // reszta kodu
}
