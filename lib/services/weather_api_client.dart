import 'dart:convert';

import 'package:krishicare/model/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(String location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2edcdf9059fd8d3a348fcf1785a052f3");
    var respone = await http.get(endpoint);
    var body = jsonDecode(respone.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
