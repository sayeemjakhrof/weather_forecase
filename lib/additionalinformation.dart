import 'package:flutter/material.dart';
import 'package:weather_forecase/additionalinformation_plate.dart';

class Additionalinformation extends StatelessWidget {
  final int humidity;
  final double wineSpeed;
  final int pressure;
  const Additionalinformation({super.key, required this.humidity, required this.wineSpeed, required this.pressure});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AdditionalinformationPlate(
          icon: Icons.water_drop,
          level: 'Humidity',
          value: '$humidity',
        ),
        AdditionalinformationPlate(
          icon: Icons.air,
          level: 'Wind Speed',
          value: '7.67',
        ),
        AdditionalinformationPlate(
          icon: Icons.beach_access,
          level: 'Pressure',
          value: '1006',
        ),
      ],
    );
  }
}
