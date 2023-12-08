class ForecastDay {
  String weatherStatus;
  double minTemp;
  double maxTemp;
  String image;
  String date;
  String sunRise;
  String sunSet;

  ForecastDay(
      {required this.weatherStatus,
      required this.image,
      required this.minTemp,
      required this.maxTemp,
      required this.date,
      required this.sunRise,
      required this.sunSet});

  factory ForecastDay.fromJson(dynamic data) {
    return ForecastDay(
      weatherStatus: data['day']['condition']['text'],
      minTemp: data['day']['mintemp_c'],
      maxTemp: data['day']['maxtemp_c'],
      date: data['date'],
      image: "day/${data['day']['condition']['code']}.png",
      sunRise: data['astro']['sunrise'],
      sunSet: data['astro']['sunset'],
    );
  }
}
