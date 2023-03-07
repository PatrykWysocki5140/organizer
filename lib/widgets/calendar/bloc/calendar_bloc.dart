import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calendar_bloc_event.dart';
part 'calendar_bloc_state.dart';

/*
// definicja eventów, które będą wysyłane do BLoC
abstract class CalendarEvent {}

class SelectDateEvent extends CalendarEvent {
  final DateTime selectedDate;

  SelectDateEvent({required this.selectedDate});
}

class AddEventEvent extends CalendarEvent {
  final DateTime date;
  final String eventName;

  AddEventEvent({required this.date, required this.eventName});
}
*/
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  //CalendarBloc() : super(CalendarState.initialState());
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
  } /*
  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
    if (event is SelectDateEvent) {
      yield state.copyWith(selectedDate: event.selectedDate);
    } else if (event is AddEventEvent) {
      final updatedEvents = Map<DateTime, List<String>>.from(state.events);
      if (updatedEvents[event.date] != null) {
        updatedEvents[event.date]!.add(event.eventName);
      } else {
        updatedEvents[event.date] = [event.eventName];
      }
      yield state.copyWith(events: updatedEvents);
    }
  }*/

  Stream<CalendarState> _refreshCalendar() async* {
    // Tutaj możesz zaimplementować logikę pobierającą najnowsze wydarzenia i zwracającą nowy stan kalendarza.
    yield state.copyWith(events: state.events);
  }
}
