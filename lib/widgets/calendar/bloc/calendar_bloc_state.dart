part of 'calendar_bloc.dart';

class CalendarState {
  final DateTime selectedDate;
  final Map<DateTime, List<String>> events;

  CalendarState({
    required this.selectedDate,
    required this.events,
  });

  factory CalendarState.initialState() {
    return CalendarState(
      selectedDate: DateTime.now(),
      events: {},
    );
  }

  CalendarState copyWith({
    DateTime? selectedDate,
    Map<DateTime, List<String>>? events,
  }) {
    // log(selectedDate.toString());
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      events: events ?? this.events,
    );
  }
}
