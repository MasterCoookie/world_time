import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/location');
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.edit_location),
                Text('Edit Location')
            ])),
        ],
      )),
    );
  }
}
