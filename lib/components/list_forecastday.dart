import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/forcast_widget.dart';
import 'package:weather_app/models/Weather_model.dart';
import '../providers/weather_provider.dart';

class ForecastList extends StatelessWidget {
  const ForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        Provider.of<WeatherProvider>(context).weatherModel;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      //width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return ForecastWidget(
                    forecastDay: weatherModel?.forecastDay?[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
