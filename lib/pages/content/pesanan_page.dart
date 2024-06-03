// ignore_for_file: camel_case_types

import 'package:crudsqf/helper/db_helper.dart';
import 'package:flutter/material.dart';

class pesananPage extends StatefulWidget {
  const pesananPage({super.key});

  @override
  State<pesananPage> createState() => _pesananPageState();
}

class _pesananPageState extends State<pesananPage> {
  final DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> _reservasi = [];
  @override
  void initState() {
    super.initState();
    _refreshUsers();
  }

  void _refreshUsers() async {
    final data = await dbHelper.queryAllUsers();
    setState(() {
      _reservasi = data;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pesanan Saya"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Text("Reservasi"),
            ..._reservasi.map((data) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  data['produk_servis'],
                  style: TextStyle(color: Colors.black),
                ),
              );
            })
          ],
        ));
  }
}
