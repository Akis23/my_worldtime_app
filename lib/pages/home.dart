import 'package:flutter/material.dart';
import 'package:my_worldtime_project/services/worldTime.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: '', url: 'Europe/Berlin');
    await instance.getTime();
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    print('initState function run');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, '/menu');
                });
              },
              icon: Icon(Icons.radio_button_on),
              label: Text(
                'Menu',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
