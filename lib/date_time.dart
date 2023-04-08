import 'dart:async';
import 'package:flutter/material.dart';

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String year = '';
  String month = '';
  String day = '';
  String weekDay = '';

  int hour = 0;
  String min = '';
  String sec = '';

  String amOrBm = 'AM';

  changeEverySecond() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        hour = DateTime.now().hour;
        if (hour > 12 ) {
          hour = hour - 12;
          amOrBm = "PM";
        }
        if (hour == 0 ) {
          hour = 12;
        }

        min = DateTime.now().minute.toString();
        sec = DateTime.now().second.toString();

        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "Jan";
            break;
          case "2":
            month = "Feb";
            break;
          case "3":
            month = "Mar";
            break;
          case "4":
            month = "Apr";
            break;
          case "5":
            month = "May";
            break;
          case "6":
            month = "Jun";
            break;
          case "7":
            month = "Jul";
            break;
          case "8":
            month = "Aug";
            break;
          case "9":
            month = "Sep";
            break;
          case "10":
            month = "Oct";
            break;
          case "11":
            month = "Nov";
            break;
          case "12":
            month = "Dec";
            break;
        }
        day = DateTime.now().day.toString();
        weekDay = DateTime.now().weekday.toString();
        switch (weekDay) {
          case "1":
            weekDay = "Monday";
            break;
          case "2":
            weekDay = "Tuesday";
            break;
          case "3":
            weekDay = "Wednesday";
            break;
          case "4":
            weekDay = "Thursday";
            break;
          case "5":
            weekDay = "Friday";
            break;
          case "6":
            weekDay = "Saturday";
            break;
          case "7":
            weekDay = "Sunday";
            break;
        }
      });
    });
  }

  @override
  // TODO: implement widget
  @override
  void initState() {
    // TODO: implement initState
    changeEverySecond();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Date & Time',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          centerTitle: true),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Today\'s Date is $weekDay',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 28),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '$day $month, $year',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 28),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            '${hour.toString().padLeft(2, '0')} : ${min.padLeft(2, '0')} : ${sec.padLeft(2, '0')} $amOrBm',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 28),
          ),
        ],
      )),
    );
  }
}
