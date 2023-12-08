import 'dart:async';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:weather_app/models/location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/list_forecastday.dart';
import 'package:weather_app/models/Weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/search_page.dart';
import 'package:weather_app/services/weather_service.dart';
import '../components/sunrise_sunsey.dart';
import '../components/widget_element.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherService weatherService = WeatherService();

  @override
  void initState() {
    super.initState();
    weatherService.getWeather(context);
    Timer.periodic(const Duration(seconds: 900), (timer) {
      weatherService.getWeather(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Location? location = Provider.of<WeatherProvider>(context).location;

    WeatherModel? weatherModel =
        Provider.of<WeatherProvider>(context).weatherModel;

    return Scaffold(
      backgroundColor: Color(0xff0c042c),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(0, 172, 103, 103),
        title: const Text(
          'Choose the location',
          style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: 'VictorMono',
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SearchPage();
            }));
          },
        ),
      ),
      body: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 4.5 / 10,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 105, 105, 105)
                                    .withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(7, 7)),
                          ],
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              colors: [
                                Color.fromARGB(78, 255, 255, 255)
                                    .withOpacity(0.3),
                                Color.fromARGB(78, 255, 255, 255)
                                    .withOpacity(0.1)
                              ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Column(
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location?.city ?? '',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontFamily: 'VictorMono',
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      location?.country ?? '',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontFamily: 'VictorMono',
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${weatherModel?.getCurrentDay().temp}°',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontFamily: 'VictorMono',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'feels like ${weatherModel?.getCurrentDay().feelslike}°',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontFamily: 'VictorMono',
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                weatherModel?.getCurrentDay().weatherStatus ??
                                    '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: 'VictorMono',
                                    fontWeight: FontWeight.bold),
                              ),
                              Image(
                                image: AssetImage(weatherModel != null
                                    ? 'assets/images/${weatherModel?.getCurrentDay().image}'
                                    : 'assets/images/day/1000.png'),
                                width: 70,
                                height: 70,
                              ),
                              Spacer(
                                flex: 1,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherElement(
                                  element: 'Wind',
                                  percentage:
                                      weatherModel?.getCurrentDay().wind ?? 0,
                                  unit: 'Km'),
                              WeatherElement(
                                  element: 'Humidity',
                                  percentage: weatherModel
                                          ?.getCurrentDay()
                                          .humidity
                                          .toDouble() ??
                                      0,
                                  unit: '%'),
                              WeatherElement(
                                  element: 'Pressure',
                                  percentage: weatherModel
                                          ?.getCurrentDay()
                                          .pressure
                                          .toDouble() ??
                                      0,
                                  unit: 'mp'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SunRiseSet(),
                    const ForecastList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
