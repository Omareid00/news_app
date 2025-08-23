
import 'package:flutter/material.dart';
import 'package:news_app/screens/layoutscreen.dart';
import 'package:news_app/screens/newsscreen.dart';
import 'package:news_app/screens/splashscreen.dart';
class APPROUTES{
  APPROUTES._();
  static const String splash="Splash";
  static const String layoutScreen="LayoutScreen";
  static const String newsScreen="NewsScreen";



}
class ROUTES{
  ROUTES._();
  static Map<String, Widget Function(BuildContext)> routes ={
    APPROUTES.splash :(_)=> Splashscreen(),
    APPROUTES.layoutScreen :(_)=> LayoutScreen(),
    APPROUTES.newsScreen :(_)=> NewsScreen(),


  };
}