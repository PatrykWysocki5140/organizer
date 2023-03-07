import 'package:flutter/material.dart';
import 'package:organizer/models/event.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late DateTime _date;
  late String _note;

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              SizedBox(height: 16.0),
              ListTile(
                title: Text('Date'),
                subtitle: Text('${_date.year}-${_date.month}-${_date.day}'),
                onTap: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    setState(() {
                      _date = date;
                    });
                  }
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Note',
                ),
                maxLines: null,
                onSaved: (value) {
                  _note = value!;
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            final event = Event(
              title: _title,
              date: _date,
              note: _note,
            );
            Navigator.pop(context, event);
          }
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
