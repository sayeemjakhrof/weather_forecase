import 'package:flutter/material.dart';

class AdditionalinformationPlate extends StatelessWidget {
  final IconData icon;
  final String level;
  final String value;
  const AdditionalinformationPlate(
      {super.key,
      required this.icon,
      required this.level,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Icon(
          icon,
          size: 30,
        ),
        Text(
          level,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
