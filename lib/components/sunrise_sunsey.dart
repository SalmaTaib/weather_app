import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/models/forecast_day.dart';
import 'package:weather_app/providers/weather_provider.dart';

class SunRiseSet extends StatelessWidget {
  const SunRiseSet({super.key});

  @override
  Widget build(BuildContext context) {
    Color colorT = Color.fromARGB(78, 255, 255, 255);
    ForecastDay? forecastDay = Provider.of<WeatherProvider>(context)
        .getWeatherModel()
        ?.forecastDay?[0];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 105, 105, 105).withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: Offset(4, 4)),
          ],
          borderRadius: BorderRadius.circular(25),

          //color: Colors.white.withOpacity(0.3),

          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [colorT.withOpacity(0.3), colorT.withOpacity(0.1)])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage('assets/images/sunrise.png'),
            width: 50,
            height: 50,
          ),
          Text(
            forecastDay?.sunRise ?? '',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'VictorMono',
                fontWeight: FontWeight.w800),
          ),
          Image(
            image: AssetImage('assets/images/sunset.png'),
            width: 50,
            height: 50,
          ),
          Text(
            forecastDay?.sunSet ?? '',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'VictorMono',
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
