import 'package:flutter/material.dart';
import 'package:my_worldtime_project/services/worldTime.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Berlin', flag: '', url: 'Europe/Berlin');
    await instance.getTime();
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Text(time)));
  }
}
