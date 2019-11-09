import 'package:amge/external_lib/utilsScreen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  UtilsScreen screen = UtilsScreen.getInstance(
    backgroundColor1: Color(0xFF68a1f8),
    backgroundColor2: Color(0xFF3339fa),
    highlightColor: Color(0xFF5e43fc),
    foregroundColor: Colors.white,
    logo: AssetImage("assets/images/logo.png"),
  );
  CalendarController _ctrlCalendar;

  @override
  void initState() {
    super.initState();
    _ctrlCalendar = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end:
              Alignment(1.0, 3.0), // 10% of the width, so there are ten blinds.
          colors: [
            screen.foregroundColor,
            screen.foregroundColor,
            screen.foregroundColor,
            screen.backgroundColor1,
          ], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            //color: Colors.white,
            padding: EdgeInsets.only(top: 25),
            child: TableCalendar(
              calendarController: _ctrlCalendar,
            ),
          ),
        ],
      ),
    );
  }
}
