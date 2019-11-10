import 'package:amge/controller/controllerEvents.dart';
import 'package:amge/external_lib/utilsScreen.dart';
import 'package:amge/model/userEvents.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  ControllerEvents ctrlEvento = ControllerEvents();
  CalendarController _ctrlCalendar;
  Map<DateTime, List> _events;
  List<UserEvents> eventos = [];
  List<UserEvents> _selectedEvents;

  @override
  void initState() {
    _getEventsMap().then((value) {
      new Future<String>.delayed(
              new Duration(milliseconds: 10), () => '["123", "456", "789"]')
          .then((String value) {
        setState(() {
          print("Agora foi!");
        });
      });
      print('OK!!!');
    });

    super.initState();
    _ctrlCalendar = CalendarController();
  }

  Future _getEventsMap() async {
    final _selectedDay =
        DateTime.parse(DateFormat("yyyy-MM-dd").format(DateTime.now()));

    eventos = await ctrlEvento.getEventos();
    _events = ctrlEvento.getMapEvents(eventos);
    print("selectedDay = " + _selectedDay.toString());
    _selectedEvents = _events[_selectedDay] ?? [];
    // print(_events.toString());
  }

  void _onDaySelected(DateTime day, List<UserEvents> events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment(
                1.0, 3.0), // 10% of the width, so there are ten blinds.
            colors: [
              screen.foregroundColor,
              screen.foregroundColor,
              screen.foregroundColor,
              screen.backgroundColor1,
            ], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        // width: double.infinity,
        // height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            _calendar(),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: _eventList(),
            )
          ],
        ),
      ),
    );
  }

  Widget _calendar() {
    return TableCalendar(
      locale: 'pt_BR',
      calendarStyle: CalendarStyle(
        markersColor: screen.backgroundColor1,
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      calendarController: _ctrlCalendar,
      events: _events,
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
      },
    );
  }

  Widget _eventList() {
    return ListView(
      children: _selectedEvents
              ?.map((event) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(
                          width: 0.8, color: screen.backgroundColor2),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: ListTile(
                      title: Text(
                        event.getTitulo(),
                        style: TextStyle(
                            color: screen.backgroundColor1,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                      subtitle:
                          Text(event.getDataIni() + " - " + event.getDataFim()),
                      onTap: () => print(' tapped!'),
                    ),
                  ))
              ?.toList() ??
          [],
    );
  }
}
