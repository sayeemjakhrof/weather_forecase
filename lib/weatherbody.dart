import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecase/additionalinformation.dart';
import 'package:weather_forecase/weatherforecast.dart';
import 'package:http/http.dart' as http;

class Weatherbody extends StatefulWidget {
  const Weatherbody({super.key});

  @override
  State<Weatherbody> createState() => _WeatherbodyState();
}

class _WeatherbodyState extends State<Weatherbody> {
  Future<Map<String, dynamic>> getData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=402c0a8113478be700c6741f00dfaae5'),
      );
      final data = jsonDecode(response.body);
      if (data['cod'] != '200') {
        throw Exception('An unexceted error occurred');
      }
      //print(data);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Icons.refresh,
                size: 20,
              ))
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshort) {
          if (snapshort.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshort.hasError) {
            return Center(
              child: Text(snapshort.error.toString()),
            );
          }
          //print(snapshort.data);
          final data = snapshort.data!;
          final currentWeatherData = data['list'][0];
          final currentTemp = currentWeatherData['main']['temp'];
          final currentSky = currentWeatherData['weather'][0]['main'];
          final currentHumidity = currentWeatherData['main']['humidity'];
          final currentWindSpeed = currentWeatherData['wind']['speed'];
          final currentPressure = currentWeatherData['main']['pressure'];

          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 60,
                              ),
                              Text(
                                '$currentSky',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final hourlyWeather = data['list'][index + 1];
                      final time = DateTime.parse(hourlyWeather['dt_txt']);
                      final hourlySky =
                          data['list'][index + 1]['weather'][0]['main'];
                      return HourlyForcastWeather(
                        level: DateFormat.Hm().format(time),
                        icon: hourlySky == "Clouds" || hourlySky == 'Rain'
                            ? Icons.cloud
                            : Icons.sunny,
                        value: hourlyWeather['main']['temp'].toString(),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Additional Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Additionalinformation(
                    humidity: currentHumidity,
                    wineSpeed: currentWindSpeed,
                    pressure: currentPressure,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
