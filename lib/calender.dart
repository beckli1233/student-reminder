import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'setup.dart';
import 'event.dart';

class CalenderPage extends StatefulWidget {
  CalenderPage({Key? key, required this.data}) : super(key: key);
  final List<EventData> data;

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  void checkDate() {
    DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(2000),
            lastDay: DateTime(2099),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print("Focus Day: " + focusDay.toString());
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(
                color: Colors.black,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Flexible(
              child: Column(
                children: _buildEventWidget(context),
              ),
            )
          ])
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {});
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SetUpPage(
                        date: selectedDay,
                        data: widget.data,
                      )),
            );
          },
          child: Icon(Icons.add)),
    );
  }

  List<Widget> _buildEventWidget(BuildContext context) {
    List<Widget> result = [];

    widget.data.forEach((element) {
      if (element.year == selectedDay.year &&
          element.month == selectedDay.month &&
          element.days == selectedDay.day) {
        print("Found matched day on: " + selectedDay.toString());
        result.add(SimpleDialogOption(
          onPressed: () {
            _buildDetailEventDialog(context, element);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Date: " + selectedDay.toString().split(' ')[0]),
              Text("Event: " + element.event),
            ],
          ),
        ));
      }
    });

    return result;
  }

  Future<void> _buildDetailEventDialog(
      BuildContext context, EventData element) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Detail For Event:'),
            children: <Widget>[Text(element.exportInfo())],
          );
        });
  }
}
