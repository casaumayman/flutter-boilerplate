

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';
import '../../../models/event.dart';




class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();


  @override
  void initState() {
    selectedEvents = {};

    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TableCalendar(
          focusedDay: selectedDay,
          firstDay: DateTime.now(),
          lastDay: DateTime(2030),


          calendarFormat: format,

          onFormatChanged: (CalendarFormat _format) {
            setState(() {
              format = _format;
            });
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          daysOfWeekVisible: true,

          //Day Changed
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
            print(focusedDay);
          },

          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
          eventLoader: _getEventsfromDay,
          //To style the Calendar
          calendarStyle: const CalendarStyle(

            todayTextStyle: TextStyle(color: Colors.blue),
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(

            ),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: HeaderStyle(
            titleTextFormatter: (date, locale)=>  DateFormat('y/MM').format(date),
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonShowsNext: true,
            decoration: const BoxDecoration(
                color: Color(0xFFF8F8F8)
            ),
            leftChevronIcon:Container(
                width: 10,
                height: 10,
                child:Icon(Icons.arrow_left,color: Colors.grey,size:25,) ),
                rightChevronIcon:Container(
                width: 10,
                height: 10,
                child:Icon(Icons.arrow_right,color: Colors.grey,size: 25,)),
            formatButtonDecoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            formatButtonTextStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        // ..._getEventsfromDay(selectedDay).map(
        //       (Event event) => ListTile(
        //     title: Text(
        //       event.title,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
