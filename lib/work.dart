import 'package:flutter/material.dart';

class WorkPage extends StatefulWidget {
  WorkPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WorkPageState createState() => _WorkPageState();
}
class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
                'App Logo - Screen NO.2'
            ),
            Text(
                'my demo app - Screen NO.2'
            ),
            Text(
                'App Logo'
            ),

          ],
        ),
      ),
    );
  }
}
