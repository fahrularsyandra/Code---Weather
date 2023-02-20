import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/styles/text.dart';

class DailyWeatherCard extends StatelessWidget {
  DateTime date;
  DailyWeatherCard(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('EE MMM dd', 'en').format(date),
                  style: textStyle(14, FontWeight.w400, Colors.white),
                ),
                Row(
                  children: [
                    Text('29 / 25 \u00B0C',
                        style: textStyle(14, FontWeight.w400, Colors.white)),
                    const Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 12),
                      child: Icon(
                        Icons.cloud,
                        color: Colors.white,
                      ),
                    ),
                    const InkWell(
                        onTap: null,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 14,
                        ))
                  ],
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
