import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather/bloc/cubit/weather_cubit.dart';
import 'package:open_weather/bloc/weather_bloc.dart';
import 'package:open_weather/bloc/weather_event.dart';
import 'package:open_weather/models/weather_model.dart';
import 'package:open_weather/styles/text.dart';
import 'package:open_weather/views/components/daily_weather_card.dart';
import 'package:open_weather/views/components/hourly_weather_card.dart';
import 'package:open_weather/views/setting_view.dart';
import 'package:open_weather/views/splash_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _weatherBloc = WeatherBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _weatherBloc.add(GetWeather());
  }

  @override
  void dispose() {
    _weatherBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // WeatherRepository().getCurrentWeather();
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => _weatherBloc,
      child: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errorMessage ?? 'Something went wrong!')));
          }
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const SplashScreen();
            } else if (state is WeatherLoading) {
              return const SplashScreen();
            } else if (state is WeatherLoaded) {
              return View(context, state.weatherModel);
            } else if (state is WeatherError) {
              return Container(
                child: Text(
                  state.errorMessage ?? 'Error',
                  style: textStyle(12, FontWeight.w400, Colors.white),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  BuildContext context;
  WeatherModel weather;
  View(
    this.context,
    this.weather, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                        weather.name ?? '-',
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
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SettingView()));
                    },
                    child: const Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
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
                          weather.weather![0].main ?? '-',
                          style: textStyle(
                              10.toDouble(), FontWeight.w400, Colors.white),
                        ),
                        Text(
                          weather.weather![0].description ?? '-',
                          style: textStyle(
                              10.toDouble(), FontWeight.w400, Colors.white54),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  '${(weather.main!.temp! - 273.15).toStringAsFixed(0)}\u00B0C',
                  style: textStyle(60, FontWeight.w200, Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Feels like ${(weather.main!.feelsLike! - 273.15).toStringAsFixed(0)}\u00B0C',
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
                          'Wind: ${(weather.wind!.speed)!.toStringAsFixed(1)}m/s NE',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                        Text(
                          'Humidity: ${weather.main!.humidity}%',
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
                          'Pressure: ${weather.main!.pressure}hPa',
                          style: textStyle(14, FontWeight.w700, Colors.white),
                        ),
                        Text(
                          'Visibility: ${(weather.visibility! / 1000).toStringAsFixed(1)}Km',
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
