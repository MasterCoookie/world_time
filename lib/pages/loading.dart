import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/Europe/Warsaw'), headers: headers);
    Map data = jsonDecode(response.body);
    // print(data);

    //getting properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);
    
    //creating DatTime
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
