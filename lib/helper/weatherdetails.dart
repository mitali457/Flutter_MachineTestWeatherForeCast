import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machinetest/models/weatherforecast.dart';

class Weather {
  WeatherForecast weather;
  Future<void> getWeather({String city = 'Kolkata'}) async {
    try {
      String url =
          "http://api.weatherstack.com/forecast?access_key=a3fd7937c2b651f30024b0cf5a7a3cfe&query=$city";
      var response = await http.get(url);
      print(response.body);

      if (response.statusCode == 200) {
        weather = WeatherForecast.fromJson(json.decode(response.body));
        print (weather.location.localtime);
      } else {
        throw Exception('Failed to load album');
      }
    } catch (e) {
print("erroe");
      print(e);
    }
  }
}

Weather weatherData = Weather();
