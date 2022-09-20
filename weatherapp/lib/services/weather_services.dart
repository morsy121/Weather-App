import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/weather_model.dart';

class WeatherServices {
  String baseUrl = "http://api.weatherapi.com/v1";
  String apiKey = "bedeac85b0d941b3a80160254221709";

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&");
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    //print(data);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
