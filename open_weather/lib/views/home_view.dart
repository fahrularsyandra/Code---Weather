import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather/repositories/weather_repository.dart';
import 'package:open_weather/styles/text.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:open_weather/views/components/daily_weather_card.dart';
import 'package:open_weather/views/components/hourly_weather_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherRepository().getCurrentWeather();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(400),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Sungai Harapan, Batam City",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const Icon(
                    Icons.tune,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 180,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.cloud,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Few Clouds',
                          style: textStyle(
                              10.toDouble(), FontWeight.w400, Colors.white),
                        ),
                        Text(
                          'Moderate breeze',
                          style: textStyle(
                              10.toDouble(), FontWeight.w400, Colors.white54),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  '30\u00B0C',
                  style: textStyle(60, FontWeight.w200, Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Feels like 34\u00B0C',
                    style: textStyle(10, FontWeight.w500, Colors.white54),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              'No Participation within an hour',
              style: textStyle(12, FontWeight.w700, Colors.white),
            ),
          ),
          // Container(
          //   color: Colors.white,
          //   padding: const EdgeInsets.symmetric(vertical: 20),
          //   height: 300,
          //   width: width,
          //   child: LineChart(
          //     LineChartData(
          //       lineTouchData: LineTouchData(enabled: true),
          //       gridData: FlGridData(),
          //       titlesData: FlTitlesData(
          //         rightTitles: AxisTitles(),
          //         topTitles: AxisTitles(),
          //       ),
          //       borderData: FlBorderData(
          //           show: true,
          //           border:
          //               const Border(bottom: BorderSide(color: Colors.green))),
          //       lineBarsData: [
          //         LineChartBarData(
          //           spots: const [
          //             FlSpot(1, 1),
          //             FlSpot(3, 1.5),
          //             FlSpot(5, 1.4),
          //             FlSpot(7, 3.4),
          //             FlSpot(10, 2),
          //             FlSpot(12, 2.2),
          //             FlSpot(13, 1.8),
          //           ],
          //           barWidth: 2,
          //         )
          //       ],
          //       minX: 0,
          //       maxX: 14,
          //       maxY: 20,
          //       minY: 0,
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 70,
              decoration: BoxDecoration(
                  color: Color(0xff7F8487),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Wind: 7.2m/s NE',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                        Text(
                          'Humidity: 66%',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                        Text(
                          'UV index: 8.2',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pressure: 1013hPa',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                        Text(
                          'Visibility: 10.0Km',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                        Text(
                          'Dew point: 23`C',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 24; i++)
                    HourlyWeatherCard(DateTime.now().add(Duration(hours: i)))
                ],
              ),
            ),
          ),
          for (int i = 0; i < 7; i++)
            DailyWeatherCard(DateTime.now().add(Duration(days: i)))
        ],
      )),
    );
  }
}
