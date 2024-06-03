// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:crudsqf/pages/content/home_page.dart';
import 'package:crudsqf/component/nav.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D3557),
      ),
      body: SingleChildScrollView(
        // Gunakan SingleChildScrollView untuk menghindari masalah konten yang lebih besar dari layar
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 60,
                    color: const Color(0xFF1D3557),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/logo-rounded-group.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Text(
                  "We glad to see you again, please login to continue our app",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "Input Email",
                    border: const OutlineInputBorder(),
                    prefixIcon: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/images/User_scan_light.png"),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Input Password",
                    border: const OutlineInputBorder(),
                    prefixIcon: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset("assets/images/Lock_light.png"),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => navComponent(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D3557),
                    fixedSize: const Size(700, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(15.0),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
