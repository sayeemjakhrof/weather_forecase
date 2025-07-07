import 'package:flutter/material.dart';
import 'package:weather_forecase/weatherbody.dart';

void main() {
  runApp(Weather());
}

class WeatherApps extends StatelessWidget {
  const WeatherApps({super.key});

  @override
  Widget build(BuildContext context) {
    return Weather();
  }
}

class Weather extends StatefulWidget {
  const Weather({super.key});
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherApps',
      theme: ThemeData.dark(useMaterial3: true),
      home: Weatherbody(),
    );
  }
}
