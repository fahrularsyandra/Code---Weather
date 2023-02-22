import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_weather/styles/text.dart';

class CustomizeUnitView extends StatefulWidget {
  const CustomizeUnitView({super.key});

  @override
  State<CustomizeUnitView> createState() => _CustomizeUnitViewState();
}

class _CustomizeUnitViewState extends State<CustomizeUnitView> {
  List temps = ['\u00B0C', '\u00B0F'];
  List windSpeeds = ['m/s', 'km/h', 'mph'];
  List pressures = ['hPa', 'inHg'];
  List precipitations = ['mm', 'in'];
  List distances = ['km', 'mi'];
  List timeFormats = ['24-hour', '12-hour'];
  int selectedTemp = 0;
  int selectedWs = 0;
  int selectedPress = 0;
  int selectedPrec = 0;
  int selectedDist = 0;
  int selectedTs = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(400),
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
                          "Settings",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Units',
                    style: textStyle(16, FontWeight.w800, Colors.white),
                  ),
                  const SizedBox(
                    width: 60,
                  )
                ],
              ),
            ),
          )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Temperature',
                    textAlign: TextAlign.left,
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    height: 28,
                    child: ListView.builder(
                      itemCount: temps.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            selectedTemp = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: (selectedTemp == index)
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          height: 28,
                          width: 90,
                          child: Center(
                            child: Text(
                              temps[index],
                              textAlign: TextAlign.left,
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wind speed',
                    textAlign: TextAlign.left,
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    height: 28,
                    child: ListView.builder(
                      itemCount: windSpeeds.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            selectedWs = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: (selectedWs == index)
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          height: 28,
                          width: 60,
                          child: Center(
                            child: Text(
                              windSpeeds[index],
                              textAlign: TextAlign.left,
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pressure',
                    textAlign: TextAlign.left,
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    height: 28,
                    child: ListView.builder(
                      itemCount: pressures.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            selectedPress = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: (selectedPress == index)
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          height: 28,
                          width: 90,
                          child: Center(
                            child: Text(
                              pressures[index],
                              textAlign: TextAlign.left,
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Precipitation',
                    textAlign: TextAlign.left,
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    height: 28,
                    child: ListView.builder(
                      itemCount: precipitations.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            selectedPrec = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: (selectedPrec == index)
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          height: 28,
                          width: 90,
                          child: Center(
                            child: Text(
                              precipitations[index],
                              textAlign: TextAlign.left,
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Distance',
                    textAlign: TextAlign.left,
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    height: 28,
                    child: ListView.builder(
                      itemCount: distances.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            selectedDist = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: (selectedDist == index)
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          height: 28,
                          width: 90,
                          child: Center(
                            child: Text(
                              distances[index],
                              textAlign: TextAlign.left,
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Time format',
                    textAlign: TextAlign.left,
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  SizedBox(
                    width: 180,
                    height: 28,
                    child: ListView.builder(
                      itemCount: timeFormats.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () {
                          setState(() {
                            selectedTs = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: (selectedTs == index)
                                  ? Colors.grey.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8)),
                          height: 28,
                          width: 90,
                          child: Center(
                            child: Text(
                              timeFormats[index],
                              textAlign: TextAlign.left,
                              style:
                                  textStyle(14, FontWeight.w400, Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
          ],
        ),
      ),
    );
  }
}
