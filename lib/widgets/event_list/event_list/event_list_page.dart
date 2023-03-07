import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../calendar/bloc/calendar_bloc.dart';

class EventListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        if (!state.events.containsKey(state.selectedDate)) {
          return Center(
            child: Text('No events for selected date'),
          );
        }

        return ListView.builder(
          itemCount: state.events[state.selectedDate]!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.events[state.selectedDate]![index]),
            );
          },
        );
      },
    );
  }
}
