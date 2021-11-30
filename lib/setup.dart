import 'event.dart';
import 'package:flutter/material.dart';


class SetUpPage extends StatefulWidget {
  SetUpPage({Key? key, required this.date, required this.data})
      : super(key: key);
  final DateTime date;
  final List<EventData> data;

  @override
  _SetUpPageState createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  var eventController = TextEditingController();
  int hourDropdownVal = 0;
  int minDropdownVal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Hour: '),
                SizedBox(
                  width: 100,
                ),
                DropdownButton<int>(
                  value: hourDropdownVal,
                  items: <int>[for (int i = 0; i <= 23; i++) i]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    setState(() {
                      hourDropdownVal = value!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text('Minutes: '),
                SizedBox(
                  width: 100,
                ),
                DropdownButton<int>(
                  value: minDropdownVal,
                  items: <int>[for (int i = 0; i <= 59; i++) i]
                      .map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    setState(() {
                      minDropdownVal = value!;
                    });
                  },
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                EventData info = EventData(
                    widget.date.year,
                    widget.date.month,
                    widget.date.day,
                    hourDropdownVal,
                    minDropdownVal,
                    eventController.text);
                //test1.update(widget.date.year, widget.date.month, widget.date.day);
                info.show();
                widget.data.add(info);
                Navigator.pop(context);
              },
              child: const Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
