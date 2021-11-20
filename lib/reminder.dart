import 'package:flutter/material.dart';
import 'event.dart';

class ReminderPage extends StatefulWidget {
  ReminderPage({Key? key, required this.data}) : super(key: key);
  final List<EventData> data;
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State< ReminderPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: (){
           },
          leading: IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              widget.data.removeAt(index);
              setState(() {

              });
            },
          ),
          title: Container(
            height: 50,
            color: Colors.amber,
            margin: EdgeInsets.only(top:5,bottom: 5, left: 5, right:5),
            child: Row(
              children: [
                Text(
                    widget.data[index].event,
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                ),
                Spacer(),
                Text(
                  widget.data[index].year.toString() + "/"
                ),
                Text(
                    widget.data[index].month.toString() + "/"
                ),
                Text(
                    widget.data[index].days.toString() + "/  "
                ),
                Text(
                    widget.data[index].hours.toString() + ":"
                ),
                Text(
                    widget.data[index].mins.toString() + " "
                ),
              ],

            ),
          ),
        );
        },
      ),
/*        floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SetUpPage(title:'Set Up Event')),
              );
            },
          child: Icon(Icons.add)
        ),*/
    );

  }
}