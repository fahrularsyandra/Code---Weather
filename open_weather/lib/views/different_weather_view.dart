import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/text.dart';

class DifferentWeatherView extends StatefulWidget {
  const DifferentWeatherView({super.key});

  @override
  State<DifferentWeatherView> createState() => _DifferentWeatherViewState();
}

class _DifferentWeatherViewState extends State<DifferentWeatherView> {
  int temperature = 31;
  int wind = 2;
  int selectedIndex = 1;
  List dataSources = <String>[
    'Personal feelings',
    'Own weather station or devices',
    'Local weather provider',
    'Globa weather provider',
    'Other',
  ];
  int? selectedDataSource;
  var email = TextEditingController();
  var message = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    message.dispose();
    super.dispose();
  }
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
                    'Different Weather?',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 162,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisExtent: 54),
                itemCount: 9,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    print(index);
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: (selectedIndex == index)
                          ? Theme.of(context).highlightColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 120,
                    height: 54,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Icon(
                            Icons.cloud,
                            color: Color(0xffc4c4c4),
                          ),
                        ),
                        Center(
                            child: Text(
                          "Rain",
                          style: textStyle(12, FontWeight.w400, Colors.white30),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Temperature:',
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  Text(
                    '$temperature\u00B0C',
                    style: textStyle(14, FontWeight.w600, Colors.white30),
                  ),
                ],
              ),
            ),
            Slider(
              value: temperature.toDouble(),
              onChanged: (x) {
                setState(() {
                  temperature = x.toInt();
                });
              },
              min: 21,
              max: 41,
              activeColor: const Color.fromARGB(255, 52, 251, 231),
              thumbColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '21\u00B0C',
                    style: textStyle(14, FontWeight.w600, Colors.white30),
                  ),
                  Text(
                    '31\u00B0C',
                    style: textStyle(14, FontWeight.w600, Colors.white30),
                  ),
                  Text(
                    '41\u00B0C',
                    style: textStyle(14, FontWeight.w600, Colors.white30),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wind:',
                    style: textStyle(14, FontWeight.w800, Colors.white),
                  ),
                  Text(
                    '$temperature\u00B0C',
                    style: textStyle(14, FontWeight.w600, Colors.white30),
                  ),
                ],
              ),
            ),
            Slider(
              value: wind.toDouble(),
              onChanged: (x) {
                setState(() {
                  wind = x.toInt();
                });
              },
              min: 1,
              max: 3,
              activeColor: const Color.fromARGB(255, 52, 251, 231),
              thumbColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Light',
                    style: textStyle(12, FontWeight.w500, Colors.white30),
                  ),
                  Text(
                    'Moderate',
                    style: textStyle(12, FontWeight.w500, Colors.white30),
                  ),
                  Text(
                    'Strong',
                    style: textStyle(12, FontWeight.w500, Colors.white30),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: email,
                  style: textStyle(14, FontWeight.w500, Colors.white),
                  decoration: InputDecoration(
                      hintText: 'Email (optional)',
                      hintStyle: textStyle(14, FontWeight.w700, Colors.white30),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  style: textStyle(14, FontWeight.w500, Colors.white),
                  maxLines: 7,
                  controller: message,
                  decoration: InputDecoration(
                      hintText: 'Message (optional)',
                      hintStyle: textStyle(14, FontWeight.w700, Colors.white30),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
              child: Text(
                'Data Source:',
                textAlign: TextAlign.left,
                style: textStyle(14, FontWeight.w800, Colors.white),
              ),
            ),
            Divider(
              color: Colors.white,
              thickness: 0.5,
            ),
            for (int i = 0; i < dataSources.length; i++)
              CheckboxListTile(
                tileColor: Colors.grey.withOpacity(0.1),
                activeColor: Color.fromARGB(255, 157, 248, 217),
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                checkColor: Colors.transparent,
                selectedTileColor: Colors.white,
                title: Text(
                  dataSources[i],
                  style: textStyle(14, FontWeight.w400, Colors.white),
                ),
                value: (selectedDataSource == i) ? true : false,
                onChanged: (newValue) {
                  setState(() {
                    selectedDataSource = i;
                  });
                },
                controlAffinity:
                    ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            MaterialButton(
              onPressed: () {
                print({
                  'weather': selectedIndex,
                  "temperature": temperature,
                  'wind' : wind,
                  'email': email.text,
                  'message': message.text,
                  'data_source': selectedDataSource
                });
              },
              minWidth: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Text(
                'Send',
                style: textStyle(20, FontWeight.w300, Colors.lightBlue),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
