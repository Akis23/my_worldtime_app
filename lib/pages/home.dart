import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_worldtime_project/services/worldTime.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    void clock() async {
      WorldTime instance =
          WorldTime(location: data['location'], flag: '', url: data['url']);
      await instance.getTime();

      Timer(Duration(minutes: 1), clock);

      setState(() {
        data['time'] = instance.time;
      });
    }

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/menu');
                    setState(() {
                      clock();
                      if (result != null) {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'isDayTime': result['isDayTime'],
                          'url': result['url']
                        };
                      } else {
                        data = data;
                      }
                    });
                  },
                  icon: Icon(Icons.radio_button_on),
                  label: Text(
                    'Menu',
                  ),
                ),
                SizedBox(height: 130.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(
                      data['location'],
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(data['time'], style: TextStyle(fontSize: 66.0))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
