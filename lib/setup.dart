
import 'event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class SetUpPage extends StatefulWidget {
  SetUpPage({Key? key, required this.date, required this.data}) : super(key: key);
  final DateTime date;
  final List<EventData> data;

  @override
  _SetUpPageState createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  var eventController = TextEditingController();
  var hoursController = TextEditingController();
  var minsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
               TextField(
                 controller: eventController,
                 obscureText: false,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Event',
                 )
          ),

              TextField(
                controller: hoursController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'hour (military time)',
                )
            ),
            TextField(
                controller: minsController,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'minutes',
                )
            ),
              TextButton(
                style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {

                  EventData info = EventData(widget.date.year, widget.date.month, widget.date.day,
                      int.parse(hoursController.text), int.parse(minsController.text), eventController.text);
                  //test1.update(widget.date.year, widget.date.month, widget.date.day);
                  info.show();
                  widget.data.add(info);
                },
                child: const Text('Add Event'),
              ),
          ],
        ),
      ),
    );
  }
}
