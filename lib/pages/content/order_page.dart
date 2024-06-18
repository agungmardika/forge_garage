// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_full_hex_values_for_flutter_colors

import 'package:forge/component/product_card.dart';
import 'package:forge/pages/content/detail_page.dart';
import 'package:forge/pages/form/form_reservasi.dart';
import 'package:flutter/material.dart';

class orderPage extends StatefulWidget {
  const orderPage({super.key});

  @override
  State<orderPage> createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Order',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        backgroundColor: Color(0xA9A9A9),
      ),

      body: productCard(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => formReservasi(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => formReservasi()));
        },
      ),
    );
  }
}
