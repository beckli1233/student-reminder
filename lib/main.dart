import 'package:flutter/material.dart';
import 'package:studentreminder/event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calender.dart';
import 'reminder.dart';
import 'event.dart';

void main() {
  runApp(MyApp(

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Student Reminder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<EventData> saveData = [];

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> saveDataInString = [];
    for (int i = 0; i < saveData.length; i++) {
      saveDataInString.add(saveData[i].exportInfo());
    }
    prefs.setStringList("eventInfo", saveDataInString);
  }

  void load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? saveDataInString = prefs.getStringList("eventInfo");
    for (int i = 0; i < saveDataInString!.length; i++) {
      EventData temp = EventData(0, 0, 0, 0, 0, '0');
      saveData.add(temp.loadInfo(saveDataInString[i]));
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      load();
    });
  }

  @override
  Widget build(BuildContext context) {

    save();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(


          child: Column(
           children: [
          Expanded(
            flex: 20,
            child: Text('Calendar',
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalenderPage(data: saveData)),
                    );
                  },
                  child: Text('Calendar',
                      style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReminderPage(data: saveData)),
                    );
                  },
                  child: Text('Reminder',
                      style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ))),
            ),
          ),
        ],
      )),
    );
  }
}
