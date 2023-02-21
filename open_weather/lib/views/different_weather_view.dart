import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/text.dart';

class DifferentWeatherView extends StatelessWidget {
  const DifferentWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
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
          children: [
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
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
                                "Rain", style: textStyle(12, FontWeight.w400, Colors.white30),
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text('data')
          ],
        ),
      ),
    );
  }
}
