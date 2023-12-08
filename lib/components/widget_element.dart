import 'package:flutter/material.dart';

class WeatherElement extends StatelessWidget {
  String element;
  double percentage;
  String unit;
  WeatherElement(
      {required this.element, required this.percentage, required this.unit});

  final TextStyle _style = const TextStyle(
    color: Colors.white,
    fontFamily: 'VictorMono',
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  final TextStyle _style2 = const TextStyle(
    color: Colors.white,
    fontFamily: 'VictorMono',
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),

      height: 60,
      //width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(element, style: _style),
          Text('$percentage $unit', style: _style2),
        ],
      ),
    );
  }
}
