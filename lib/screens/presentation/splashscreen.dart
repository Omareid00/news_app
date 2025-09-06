import 'package:flutter/material.dart';
import 'package:news_app/cores/appimages/app_images.dart';
import 'package:news_app/screens/presentation/layoutscreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();


}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
        MaterialPageRoute(
          builder: (context) => LayoutScreen(),
        ), // Replace with your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.splashLogo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
