import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast_day.dart';

import '../models/Weather_model.dart';

class ForecastWidget extends StatelessWidget {
  ForecastWidget({this.forecastDay});

  ForecastDay? forecastDay;

  @override
  Widget build(BuildContext context) {
    String day = DateFormat('EEEE')
        .format(DateTime.parse(forecastDay?.date ?? DateTime.now().toString()));

    bool isToday = DateFormat('EEEE').format(DateTime.now()).toString() == day;

    Color colorT =
        isToday ? Color(0xff1c83e4) : Color.fromARGB(78, 255, 255, 255);

    return Container(
      //padding: const EdgeInsets.fromLTRB(10, 10, 30, 30),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(0, 0, 20, 20),
      width: 120,
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

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            isToday ? 'Today' : day,
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'VictorMono',
                fontWeight: FontWeight.bold),
          ),
          Image(
            image: AssetImage(forecastDay?.image != null
                ? 'assets/images/${forecastDay?.image}'
                : 'assets/images/day/1000.png'),
            width: 40,
            height: 40,
          ),
          Text(
            '${forecastDay?.maxTemp.toString()}°',
            style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontFamily: 'VictorMono',
                fontWeight: FontWeight.bold),
          ),
          Text(
            '${forecastDay?.minTemp.toString()}°',
            style: TextStyle(
                color: Colors.white, fontSize: 11, fontFamily: 'VictorMono'),
          ),
        ],
      ),
    );
  }
}
