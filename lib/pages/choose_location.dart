import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location_ui: 'London', flag_url: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location_ui: 'Athens', flag_url: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location_ui: 'Cairo', flag_url: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location_ui: 'Nairobi', flag_url: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location_ui: 'Chicago', flag_url: 'usa.png'),
    WorldTime(url: 'America/New_York', location_ui: 'New York', flag_url: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location_ui: 'Seoul', flag_url: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location_ui: 'Jakarta', flag_url: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //nav to home screen
    Navigator.pop(context, {
        'location': instance.location_ui,
        'flag': instance.flag_url,
        'time': instance.time,
        'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location_ui),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag_url}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
