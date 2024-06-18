// ignore_for_file: camel_case_types, prefer__ructors, use_key_in_widget_ructors, unnecessary_import, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:forge/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class welcomePage extends StatefulWidget {
  welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/welcome-1.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Selamat datang di Forge Garage!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                    'Aplikasi reservasi servis yang efisien. Temukan bengkel terpercaya di sini',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Color.fromARGB(255, 3, 82, 147),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 3, 82, 147),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration.zero,
                              pageBuilder: (_, __, ___) => NewPage(),
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Lanjutkan',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Row(
                children: [
                  Text(
                    'Lewati',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_double_arrow_right,
                    color: Color.fromARGB(255, 18, 18, 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//halaman 3
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/welcome-2.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Sesuaikan Jadwal Reservasimu',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Sesuaikan Jadwal pada Aplikasi Forge Garage dengan mudah',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Color.fromARGB(255, 3, 82, 147),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 130),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration.zero,
                              pageBuilder: (_, __, ___) => welcomePage(),
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Color.fromARGB(255, 3, 82, 147),
                            ),
                            Text(
                              'Kembali',
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 82, 147),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 82, 147),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration: Duration.zero,
                                pageBuilder: (_, __, ___) => NewPage2(),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Lanjutkan',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 20,
            right: 10,
            child: Row(
              children: [
                Text(
                  'Lewati',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 18, 18, 18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_double_arrow_right,
                  color: Color.fromARGB(255, 18, 18, 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/welcome-3.png"),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Mekanik Terampil & Terintegritas',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Kami menyediakan mekanik yang berkualitas',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 5),
                const Text(
                  'untuk merawat mobil anda',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 30),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Color.fromARGB(255, 3, 82, 147),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 130),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NewPage()),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: Color.fromARGB(255, 3, 82, 147),
                            ),
                            Text(
                              'Kembali',
                              style: TextStyle(
                                color: Color.fromARGB(255, 3, 82, 147),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 3, 82, 147),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Lanjutkan',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 20,
            right: 10,
            child: Row(
              children: [
                Text(
                  'Lewati',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 18, 18, 18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_double_arrow_right,
                  color: Color.fromARGB(255, 18, 18, 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
