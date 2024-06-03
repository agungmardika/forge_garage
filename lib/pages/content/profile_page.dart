// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, use_full_hex_values_for_flutter_colors

import 'package:crudsqf/pages/content/pesanan_page.dart';
import 'package:crudsqf/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

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
                'Profile',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Divider(
                color: Color(0xFFD0CFCF),
                thickness: 2,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 5),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 191, 190, 190),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 30),
                  // Profil
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Admin",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Divider(
                color: Color(0xFFD0CFCF),
                thickness: 2,
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Isi setting
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => pesananPage()),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Color.fromARGB(255, 5, 43, 75),
                            size: 40,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Pesanan Saya',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 5, 43, 75),
                          size: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Pengaturan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 5, 43, 75),
                          size: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'FAQ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Color.fromARGB(255, 5, 43, 75),
                          size: 40,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Kebijakan Privasi',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity, // Atur lebar tombol
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
