import 'package:flutter/material.dart';

class CelsiusText extends StatelessWidget {
  const CelsiusText({super.key, required this.value, required this.style});
  final String value;
  final TextStyle style;
  @override
  Widget build(BuildContext context) {
    return Text('$value\u00B0', style: style, textAlign: TextAlign.center);
  }
}
