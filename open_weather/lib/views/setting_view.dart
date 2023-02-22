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
import 'package:open_weather/views/custom_unit_view.dart';
import 'package:open_weather/views/different_weather_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   centerTitle: true,
      //   title: Text('Settings', style: textStyle(16, FontWeight.w800, Colors.white),),
      // ),
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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0.0),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Back",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Settings',
                    style: textStyle(16, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 60,
                  )
                ],
              ),
            ),
          )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => DifferentWeatherView()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Different weather',
                      style: textStyle(14, FontWeight.w400, Colors.white),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CustomizeUnitView()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Customize units',
                      style: textStyle(14, FontWeight.w400, Colors.white),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Data',
                    style: textStyle(14, FontWeight.w500, Colors.white),
                  ),
                  Text(
                    'One Call API"',
                    style: textStyle(14, FontWeight.w400, Colors.white54),
                  )
                ],
              ),
            ),
            Text(
              """For professionals and specialists with middle sized project, we recommend our Professional collections, which included Current & Forecasts collection, Historical weather data collection, Weather Maps collection and other APIs. For Enterprise level projects we provide Enterprise license, which is included all forecast products and current state, along with alerts, maps, and other products. Learn more You can read the How to Start guide and enjoy using our powerful weather APIs right now.""",
              style: textStyle(14, FontWeight.w300, Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            // Image.network('https://seeklogo.com/images/O/openweather-logo-3CE20F48B5-seeklogo.com.png', width: 100,)
            Image.asset(
              'assets/images/openWeather-logo.png',
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
