import 'package:flutter/material.dart';
import 'package:my_worldtime_project/services/worldTime.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'London.png', url: 'Europe/London'),
    WorldTime(location: 'Abidjan', flag: 'Abidjan.png', url: 'Africa/Abidjan'),
    WorldTime(location: 'Adak', flag: 'Adak.png', url: 'America/Adak'),
    WorldTime(location: 'Athens', flag: 'Athens.jpg', url: 'Europe/Athens'),
    WorldTime(
        location: 'Bucharest', flag: 'Bucharest.png', url: 'Europe/Bucharest'),
    WorldTime(
        location: 'Budapest', flag: 'Budapest.png', url: 'Europe/Budapest'),
    WorldTime(
        location: 'Helsinki', flag: 'Helsinki.jpg', url: 'Europe/Helsinki'),
    WorldTime(location: 'Madrid', flag: 'Madrid.png', url: 'Europe/Madrid'),
    WorldTime(location: 'Paris', flag: 'Paris.png', url: 'Europe/Paris'),
    WorldTime(location: 'Prague', flag: 'Prague.png', url: 'Europe/Prague'),
    WorldTime(location: 'Rome', flag: 'Rome.jpg', url: 'Europe/Rome')
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text('Location Menu'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }),
    );
  }
}
