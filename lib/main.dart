import 'package:flutter/material.dart';
import 'package:news_app/cores/app_routes/app_routes.dart';
import 'package:news_app/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
      initialRoute: APPROUTES.splash,
      routes: ROUTES.routes,
    );
  }
}

