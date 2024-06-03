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
    _refreshReservasi();
  }

  void _refreshReservasi() async {
    final data = await dbHelper.queryAllReservasi();
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
          ..._reservasi.map(
            (data) {
              return Container(
                child: Text(
                  data['produk_servis'],
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
          Text("Tanggal Reservasi"),
          ..._reservasi.map(
            (data) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  data['tanggal_servis'],
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
          Text("Jam Servis"),
          ..._reservasi.map(
            (data) {
              return Container(
                child: Text(
                  data['jam_servis'],
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
          Text("Tipe Mobil"),
          ..._reservasi.map(
            (data) {
              return Container(
                child: Text(
                  data['tipe_mobil'],
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
