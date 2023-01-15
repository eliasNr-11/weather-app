import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  static const api = 'http://api.openweathermap.org/data/2.5/forecast';

  static Future<Map<String, dynamic>> fetchWeather(String appid, String unit, String city) {
    return http
        .get(Uri.parse(
            'http://api.openweathermap.org/data/2.5/forecast?appid=$appid&units=$unit&q=$city'))
        .then((data) async {
      final jsonResult = await json.decode(data.body);

      return jsonResult;
    });
  }
}
