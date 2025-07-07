import 'dart:ui';
import 'package:flutter/material.dart';

class HourlyForcastWeather extends StatelessWidget {
  final String level;
  final IconData icon;
  final String value;
  const HourlyForcastWeather(
      {super.key,
      required this.level,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  level,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(
                  icon,
                  size: 30,
                ),
                Text(
                  value,
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
