import 'package:flutter/material.dart';
import 'work.dart';
import 'school.dart';
import 'personal.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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

  
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children:[
            Expanded(
              flex:20,
              child: Text(
                  'Calendar',
                  style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  )
              ),
                ),
            Expanded(
               flex:10,
                child:Container(
                  margin: EdgeInsets.only(top:30,bottom:30),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WorkPage(title: 'work')),
                        );
                      },
                      child: Text(
                          'Work',
                          style: TextStyle(
                            fontSize: 40,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )

                      )

                  ),
                ),
            ),
            Expanded(
              flex:10,
              child:Container(
                margin: EdgeInsets.only(top:30,bottom:30),
                child:ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SchoolPage(title:'school')),
                      );
                    }

                    ,
                    child: Text(
                        'School',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )

                    )

                ),
              ),
            ),
            Expanded(
              flex:10,
              child:Container(
                margin: EdgeInsets.only(top:30,bottom:30),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PersonalPage(title:'Personal')),
                      );
                    }

                    ,
                    child: Text(
                        'Personal',
                        style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )

                    )

                ),
              ),
            ),

                            ],
                     )
                  ),
    );
  }

}
