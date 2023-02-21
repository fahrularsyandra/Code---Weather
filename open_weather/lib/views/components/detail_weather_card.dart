import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather/models/weather_model.dart';
import 'package:open_weather/styles/text.dart';

class DetailWeather extends StatefulWidget {
  final Function()? callback;
  final int index;
  final WeatherModel weather;
  const DetailWeather(this.callback, this.index, this.weather, {super.key});

  @override
  State<DetailWeather> createState() => _DetailWeatherState();
}

class _DetailWeatherState extends State<DetailWeather> {
  List<Padding> dates = [];
  int selectedDate = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedDate = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) => InkWell(
                    splashColor: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      setState(() {
                        selectedDate = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: (selectedDate == index)
                              ? Colors.white30
                              : Colors.transparent),
                      padding: EdgeInsets.all(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Column(
                          children: [
                            Text(
                              DateFormat('EEE', 'en').format(
                                  DateTime.now().add(Duration(days: index))),
                              style:
                                  textStyle(12, FontWeight.w400, Colors.white),
                            ),
                            Text(
                              DateFormat('dd', 'en').format(
                                  DateTime.now().add(Duration(days: index))),
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: widget.callback,
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.weather.weather![0].main ?? '-',
                    style:
                        textStyle(12.toDouble(), FontWeight.w400, Colors.white),
                  ),
                  Text(
                    widget.weather.weather![0].description ?? '-',
                    style: textStyle(
                        12.toDouble(), FontWeight.w400, Colors.white54),
                  ),
                ],
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
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xff332C39), borderRadius: BorderRadius.circular(8)),
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                enabled: true,
              ),
              gridData: FlGridData(getDrawingVerticalLine: (x) {
                return FlLine(
                    color: Colors.white30, strokeWidth: 2, dashArray: [4]);
              }, getDrawingHorizontalLine: (x) {
                return FlLine(
                    color: Color(0xff609EA2), strokeWidth: 2, dashArray: [4]);
              }),
              titlesData: FlTitlesData(
                rightTitles: AxisTitles(),
                topTitles: AxisTitles(),
              ),
              borderData: FlBorderData(
                  show: true,
                  border:
                      const Border(bottom: BorderSide(color: Colors.white30))),
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(1, 1),
                    FlSpot(3, 1.5),
                    FlSpot(5, 1.4),
                    FlSpot(7, 3.4),
                    FlSpot(10, 2),
                    FlSpot(12, 2.2),
                    FlSpot(13, 1.8),
                  ],
                  barWidth: 2,
                  color: Colors.brown,
                  dotData: FlDotData(show: true),
                )
              ],
              minX: 0,
              maxX: 14,
              maxY: 40,
              minY: 0,
            ),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Precipitation',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                '0.0mm',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Probability of precipitation',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                '7%',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wind',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Row(
                children: [
                  Text(
                    '${(widget.weather.wind!.speed)!.toStringAsFixed(1)}m/s NNE',
                    style: textStyle(14, FontWeight.w400, Colors.white),
                  ),
                  const Icon(
                    Icons.arrow_outward_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pressure',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                '${widget.weather.main!.pressure}hPa',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Humidity',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                '${widget.weather.main!.humidity}%',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'UV index',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                '13.7',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sunrise',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                DateFormat('HH:mm', 'id').format(DateTime.now()),
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sunset',
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
              Text(
                DateFormat('HH:mm', 'id').format(DateTime.now()),
                style: textStyle(14, FontWeight.w400, Colors.white),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.white,
        ),
      ]),
    );
  }
}
