import 'package:flutter/material.dart';
import 'package:my_worldtime_project/pages/home.dart';
import 'package:my_worldtime_project/pages/menu.dart';
import 'package:my_worldtime_project/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/menu': (context) => ChooseLocation(),
      },
    ));
