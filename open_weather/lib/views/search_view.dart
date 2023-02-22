import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/text.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                    child: TextField(
                        style: textStyle(14, FontWeight.w400, Colors.white),
                        decoration: InputDecoration(
                          hintStyle:
                              textStyle(14, FontWeight.w400, Colors.white30),
                          hintText: 'Search',
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          prefixIconColor: Colors.grey,
                          prefixIcon: Icon(Icons.search),
                        )),
                  )
                ],
              ))),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Divider(
            thickness: 0.5,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'San Francisco',
                      style: textStyle(14, FontWeight.w500, Colors.white),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '89\u00B0F',
                      style: textStyle(14, FontWeight.w500, Colors.white),
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.cloud,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.white,
          ),
        ],
      )),
    );
  }
}
