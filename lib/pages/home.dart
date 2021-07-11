import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

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
