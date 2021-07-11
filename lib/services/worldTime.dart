import 'dart:convert';
import 'package:http/http.dart' as http;

class WorldTime {
  String location;
  String time = '';
  String flag;
  String url;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    http.Response response =
        await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    print(data);
  }
}
