// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class pesananPage extends StatefulWidget {
  const pesananPage({super.key});

  @override
  State<pesananPage> createState() => _pesananPageState();
}

class _pesananPageState extends State<pesananPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan Saya"),
        centerTitle: true,
      ),
      body: ListTile(
        leading: Text("suiuiuwsdw"),
      ),
    );
  }
}
