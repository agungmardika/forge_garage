// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, use_super_parameters, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages, library_private_types_in_public_api, use_build_context_synchronously, unused_import

import 'package:crudsqf/pages/content/home_page.dart';
import 'package:crudsqf/pages/login/login_page.dart';
import 'package:crudsqf/splash_screen/splash_screen.dart';
import 'package:crudsqf/splash_screen/welcome_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
