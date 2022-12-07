import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Budget', percent: 40, color: const Color(0xff0293ee)),
    Data(name: 'Consumption', percent: 30, color: const Color(0xfff8b250)),
    Data(name: 'Unpaid', percent: 15, color: Colors.red),
    Data(name: 'Paid', percent: 15, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String name;

  final double percent;

  final Color color;

  Data({required this.name, required this.percent, required this.color});
}