import 'package:flutter/material.dart';

Color ColorOfDay({@required weekday}) {
  Color color = Colors.grey;
  switch (weekday) {
    case 1:
      color = Colors.blue;
      break;

    case 2:
      color = Colors.black;
      break;

    case 3:
      color = Colors.cyan;
      break;
    case 4:
      color = Colors.green;
      break;
    case 5:
      color = Colors.red;
      break;
    case 6:
      color = Colors.pink;
      break;
    case 7:
      color = Colors.yellow;
      break;
    default:
      color = Colors.grey;
      break;
  }
  return color;
}

String getMonth(DateTime dateTime) {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  return months[dateTime.month - 1];
}

String WeekDayName(DateTime dateTime) {
  List<String> months = ['', 'Mon', 'Tue', 'Wed', 'Thurs', 'Fri', 'Sat', 'Sun'];
  return months[dateTime.weekday];
}

String getFullDate(DateTime selectedDate) {
  return getMonth(selectedDate) +
      " " +
      selectedDate.day.toString() +
      ", " +
      selectedDate.year.toString();
}

