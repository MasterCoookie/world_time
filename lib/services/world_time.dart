import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location_ui; // location name for the UI
  String time; // time in location
  String flag_url; // url to asset flag icon
  String url; // location url ending for API
  bool isDayTime;

  WorldTime({ this.location_ui, this.flag_url, this.url });

  Future<void> getTime() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    try {
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'),
          headers: headers);
      Map data = jsonDecode(response.body);
      // print(data);

      //getting properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(datetime);
      // print(offset);

      //creating DateTime
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    }

    catch (e) {
      print('Error cought $e');
      time = "Could not get time data";
    }
  }
}