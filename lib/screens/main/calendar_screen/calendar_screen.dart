import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:organizer/widgets/calendar/calendar_page.dart';
import 'package:organizer/widgets/calendar_s/calendar_screen.dart';
import 'package:provider/provider.dart';
import '../../../models/colors.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../widgets/event_list/event_list/event_list_page.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 60,
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/tlo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            CalendarWidget(),
            //CalendarScreenWidget(),
            Expanded(child: EventListWidget()),
          ],
        ),
      ),
    );
  }
}
