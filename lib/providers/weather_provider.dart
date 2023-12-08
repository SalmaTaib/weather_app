import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/models/location.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? weatherModel;
  Location? location;

  WeatherProvider({this.weatherModel, this.location});

  WeatherModel? getWeatherModel() {
    return weatherModel;
  }

  Location? getLocation() {
    return location;
  }

  void setWeatherModel(WeatherModel weatherModel) {
    this.weatherModel = weatherModel;

    notifyListeners();
  }

  void setLocation(Location location) {
    this.location = location;

    notifyListeners();
  }
}
