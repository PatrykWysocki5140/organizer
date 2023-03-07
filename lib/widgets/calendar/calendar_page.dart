import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../main_bottom_bar/main_bottom_bar_page.dart';
import 'bloc/calendar_bloc.dart';

class CalendarWidget extends StatefulWidget {
  @override
  //State<CalendarWidget> createState() => _CalendarWidgetState();
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  void dispose() {
    //super.setState(() {});
    //Navigator.pushNamed(context, '/loading');
  }
  TextEditingController _eventController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        int yearsAsDays = (365 * 3);
        DateTime timebefore =
            state.selectedDate.subtract((Duration(days: yearsAsDays)));
        DateTime timeafter =
            state.selectedDate.add((Duration(days: yearsAsDays)));
        return Column(
          children: [
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                labelText: 'Add Event',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    DateTime selectedDate =
                        context.read<CalendarBloc>().state.selectedDate;
                    context.read<CalendarBloc>().add(AddEventEvent(
                        date: state.selectedDate,
                        eventName: selectedDate.toString()));
                    context.read<CalendarBloc>().add(RefreshCalendarEvent());
                  },
                ),
              ),
            ),
            TableCalendar(
              selectedDayPredicate: (day) => state.selectedDate == day,
              focusedDay: state.selectedDate,
              firstDay: timebefore,
              lastDay: timeafter,
              eventLoader: (date) => state.events[date] ?? [],
              onDaySelected: (selectedDate, focusedDate) {
                context.read<CalendarBloc>().add(SelectDateEvent(
                    selectedDate:
                        selectedDate)); //context.read<CalendarBloc>().add(AddEventEvent(date: state.selectedDate,eventName: selectedDate.toString()));
                //context.read<CalendarBloc>().add(RefreshCalendarEvent());
                //dispose();
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              pageJumpingEnabled: true,
              //weekNumbersVisible: true,
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 108, 134, 156),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CalendarWidget1 extends StatefulWidget {
  @override
  _CalendarWidgetState1 createState() => _CalendarWidgetState1();
}

class _CalendarWidgetState1 extends State<CalendarWidget1> {
  DateTime _selectedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();
  Map<DateTime, List<dynamic>> _events = {};

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _eventController = TextEditingController();
    _events = {};
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  void _addEvent() {
    setState(() {
      if (_events[_selectedDay] != null) {
        _events[_selectedDay]?.add(_eventController.text);
      } else {
        _events[_selectedDay] = [_eventController.text];
      }
      _eventController.clear();
    });
  }

  Widget _buildEventList() {
    return ListView.builder(
      itemCount: _events.length,
      itemBuilder: (BuildContext context, int index) {
        DateTime date = _events.keys.elementAt(index);
        return Column(
          children: <Widget>[
            ListTile(
              title: Text('${date.day}-${date.month}-${date.year}'),
              subtitle: Text('${_events[date]?.join(', ')}'),
            ),
            // const Divider(),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int yearsAsDays = (365 * 3);
    DateTime timebefore = _selectedDay.subtract((Duration(days: yearsAsDays)));
    DateTime timeafter = _selectedDay.add((Duration(days: yearsAsDays)));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TableCalendar(
          selectedDayPredicate: (day) => _selectedDay == day,
          onDaySelected: (selectedDay, _) {
            setState(() {
              _selectedDay = selectedDay;
            });
          },
          focusedDay: _selectedDay,
          firstDay: timebefore,
          //DateTime.utc(2021, 1, 1),
          lastDay: timeafter,
          //DateTime.utc(2027, 12, 31),
          eventLoader: (date) => _events[date] ?? [],
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
          },
          //pageJumpingEnabled: true,
          //weekNumbersVisible: true,
          calendarStyle: const CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Color.fromARGB(255, 8, 41, 68),
              shape: BoxShape.circle,
            ),
          ),
        ),
        // SizedBox(height: 20),
        TextField(
          controller: _eventController,
          decoration: InputDecoration(
            labelText: 'Add Event',
            suffixIcon: IconButton(
              icon: Icon(Icons.add),
              onPressed: _addEvent,
            ),
          ),
        ),
        //if (_events.isNotEmpty) Expanded(child: _buildEventList()),
      ],
    );
  }
}
