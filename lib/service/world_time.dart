import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String url;
  String flag;
  bool isDay;
  WorldTime({this.location, this.flag, this.url});
  Future<void> getData() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map info = jsonDecode(response.body);
    print(info);
    String datetime = info['datetime'];
    String offset = info['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDay = now.hour > 6 && now.hour < 19 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
