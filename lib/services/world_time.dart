import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; //location name for the UI
  late String time; //time in that location
  String flag; //url to asset flag icon
  String url; //location url for api endpoint
  bool isDayTime;

  WorldTime(this.location, this.time, this.flag, this.url, this.isDayTime);


  Future<void> getTime() async {

      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));
      isDayTime = now.hour > 5 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    }
  }

