// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  productCard({
    required this.onTap,
    super.key,
  });

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 200,
                  height: 270,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: Color.fromARGB(255, 181, 179, 179),
                      width: 2,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 13,
                left: 13,
                child: Container(
                  width: 194,
                  height: 190,
                  color: Colors.white,
                  child: Image.asset("assets/images/tune up vkool.png"),
                ),
              ),
              Positioned(
                top: 210,
                left: 13,
                right: 13,
                child: Container(
                  width: 194,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Paket Ganti Oli otoXpert',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp 400.000',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
