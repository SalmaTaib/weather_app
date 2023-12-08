import 'package:weather_app/models/current_day.dart';
import 'package:weather_app/models/forecast_day.dart';

class WeatherModel {
  CurrentDay currentDay;
  List<ForecastDay>? forecastDay;
  //dynamic jsonForecast;

  WeatherModel({required this.currentDay, required this.forecastDay});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonC = data['current'];
    var jsonF = data['forecast'];

    setForecastDays(dynamic data) {
      List<ForecastDay> forecastDay = [];
      for (int i = 0; i < 3; i++) {
        forecastDay.add(ForecastDay.fromJson(data['forecastday'][i]));
      }
      return forecastDay;
    }

    return WeatherModel(
      currentDay: CurrentDay.fromJson(jsonC),
      forecastDay: setForecastDays(jsonF),
    );
  }

  CurrentDay getCurrentDay() => currentDay;
  List<ForecastDay>? getForecastDays() => forecastDay;
}
