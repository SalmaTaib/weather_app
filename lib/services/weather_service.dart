import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/providers/weather_provider.dart';

class WeatherService {
  Future<void> getWeather(context) async {
    final lat = Provider.of<WeatherProvider>(context, listen: false)
            .getLocation()
            ?.lat ??
        36.76;
    final lon = Provider.of<WeatherProvider>(context, listen: false)
            .getLocation()
            ?.lon ??
        3.05;

    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=e87056fd7a214a17933173620231907&q=${lat},${lon}&days=7');

    http.Response response = await http.get(url);

    dynamic data = response.body;

    Location location = Location(lat: lat, lon: lon);

    location.setCityCountry(data);
    print('city : ${location.city}');

    Provider.of<WeatherProvider>(context, listen: false).setLocation(location);

    WeatherModel weatherModel = WeatherModel.fromJson(jsonDecode(data));

    Provider.of<WeatherProvider>(context, listen: false)
        .setWeatherModel(weatherModel);

    //print(weatherModel.forecastDay?[1].date);
  }
}
