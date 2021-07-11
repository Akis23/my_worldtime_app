import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime cur = DateTime.parse(datetime);
      cur = cur.add(Duration(hours: int.parse(offset)));

      isDayTime = cur.hour > 6 && cur.hour < 21 ? true : false;

      time = DateFormat.jm().format(cur);
    } catch (e) {
      print('catch error: $e');
      time = 'Cant load time data';
    }
  }
}
