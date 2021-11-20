import 'dart:math';
import 'package:flutter/cupertino.dart';

class EventData {
  String event = "1";
  int year = 2000;
  int month = 0;
  int days = 0;
  int hours = 0;
  int mins = 0;

  //Constructor
  EventData(int nyear, int nmonth, int ndays, int nhours, int nmins, String nevent){
    year = nyear;
    month = nmonth;
    days = ndays;
    hours = nhours;
    mins = nmins;
    event = nevent;
  }
  void show(){
    print("year: " + year.toString());
    print("month: " + month.toString());
    print("days: " + days.toString());
    print("hours: " + hours.toString());
    print("mins: " + mins.toString());
    print("event: " + event);
  }
  String exportInfo(){

    String info = year.toString() + "," + month.toString() + ","+ days.toString()+ "," + hours.toString()+ "," + mins.toString()+ "," + event;
    return info;
  }

  EventData loadInfo(String s){
    List<String> info = s.split(",");
    year = int.parse(info[0]);
    month = int.parse(info[1]);
    days = int.parse(info[2]);
    hours = int.parse(info[3]);
    mins = int.parse(info[4]);
    event = info[5];

    return this;

  }


}