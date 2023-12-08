class CurrentDay {
  String weatherStatus;
  double temp;
  double feelslike;
  int isDay;
  String image;
  int humidity;
  double wind;
  double pressure;

  CurrentDay(
      {required this.weatherStatus,
      required this.temp,
      required this.image,
      required this.isDay,
      required this.feelslike,
      required this.wind,
      required this.humidity,
      required this.pressure});

  factory CurrentDay.fromJson(dynamic data) {
    String icon = "${data['condition']['code']}.png";

    return CurrentDay(
        weatherStatus: data['condition']['text'],
        temp: data['temp_c'],
        isDay: data['is_day'],
        feelslike: data['feelslike_c'],
        wind: data['wind_kph'],
        humidity: data['humidity'],
        pressure: data['pressure_mb'],
        image: data['is_day'] == 1 ? "day/$icon" : "night/$icon");
  }
}
