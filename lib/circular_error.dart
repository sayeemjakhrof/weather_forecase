import 'package:flutter/material.dart';

class CircularError extends StatelessWidget {
  const CircularError({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: Colors.red,
      color: Colors.amber,
      strokeWidth: 10,
      strokeCap: StrokeCap.round,
    );
  }
}
