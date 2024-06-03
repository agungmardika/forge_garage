// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_local_variable, unused_import, sized_box_for_whitespace, must_be_immutable, unnecessary_import, prefer_const_constructors_in_immutables

import 'package:crudsqf/component/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    color: Color(0xFF1D3557),
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              10), // Radius untuk sudut kiri atas
                          topRight: Radius.circular(
                              10), // Radius untuk sudut kanan atas
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 300,
                height: 140,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFA8DADC),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(colors: [
            //           Color(0xFF1D3557),
            //           Color(0xFF457B9D),
            //           Color(0xFFA8DADC),
            //         ]),
            //         borderRadius: BorderRadius.circular(10)),
            //     height: 130,
            //     width: 350,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomGestureDetector extends StatelessWidget {
  const CustomGestureDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image(
            image: AssetImage("assets/images/banner1.png"),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
