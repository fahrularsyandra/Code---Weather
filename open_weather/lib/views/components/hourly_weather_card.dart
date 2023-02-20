import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../styles/text.dart';

class HourlyWeatherCard extends StatelessWidget {
  DateTime date;
  HourlyWeatherCard(this.date,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text(
            DateFormat('HH:mm', 'id').format(date),
            style: textStyle(12, FontWeight.w400, Colors.white54),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Icon(
              Icons.cloud,
              color: Colors.white,
            ),
          ),
          Text(
            '28\u2103',
            style: textStyle(14, FontWeight.w700, Colors.white),
          ),
        ],
      ),
    );
  }
}
