import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organizer/models/event.dart';
import 'package:organizer/widgets/calendar_s/AddEventScreen.dart';
import 'package:organizer/widgets/calendar_s/bloc/events_bloc.dart';

class CalendarScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is EventsLoaded) {
              return ListView.builder(
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.events[index].title),
                    subtitle: Text(state.events[index].date.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        FloatingActionButton(
          onPressed: () async {
            final Event? event = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEventScreen(),
              ),
            );
            if (event != null) {
              // ignore: use_build_context_synchronously
              BlocProvider.of<EventsBloc>(context).add(
                AddEvent(event: event),
              );
            }
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
