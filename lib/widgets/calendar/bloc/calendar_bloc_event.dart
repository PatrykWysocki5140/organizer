part of 'calendar_bloc.dart';

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

class RefreshCalendarEvent extends CalendarEvent {}
