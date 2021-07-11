import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
