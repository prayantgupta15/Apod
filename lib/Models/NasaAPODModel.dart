// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NasaAPODModel NasaAPODModelFromMap(String str) => NasaAPODModel.fromMap(json.decode(str));


class NasaAPODModel {
  NasaAPODModel({
     required this.date,
     this.explanation='',
     this.title='Not Found',
     this.url='',
  });

  DateTime date;
  String explanation;
  String title;
  String url;

  factory NasaAPODModel.fromMap(Map<String, dynamic> json) => NasaAPODModel(
    date: DateTime.parse(json["date"]),
    explanation: json["explanation"],
    title: json["title"],
    url: json["url"],
  );


}
